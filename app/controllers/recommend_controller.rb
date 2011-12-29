# coding: utf-8
class RecommendController < SearchController 

  def teacher
    @curriculums = Curriculum.where('lank = ?',params[:gakunen])
  end

  def upper_entried
    @subjects = Subject.where('year <= ?',current_user.lank)
    @ue_subs = senpai(@subjects,current_user.lank)
  end

  def api_render
    @culs = []
    @curriculums = Curriculum.where('lank = ?',params[:gakunen].to_i).includes(:subjects,:user)
    @curriculums.each do|cul|
      @subs = Array.new
      @culhash = cul.attributes
      @culhash['teacher'] = cul.user.user_name
      @culhash.delete('created_at')
      @culhash.delete('updated_at')
      @culhash.delete('id')
      @culhash.delete('user_id')
      cul.subjects.each do|sub|
        @subhash = sub.attributes
        #@subhash['average'] = sub.risyuritsu(params[:gakunen].to_i)
        @subhash.delete('created_at')
        @subhash.delete('updated_at')
        @subhash.delete('id')
        @subhash.delete('cs_comp')
        @subs << @subhash
      end
      @culhash['subjects'] = @subs
      @culs << @culhash
    end

    @uesubs = Subject.where('year <= ?',params[:gakunen].to_i)
    @h = []
    @uesubs.each do |sub|
      if sub.risyuritsu(params[:gakunen].to_i) >= 60
        @hsubhash = sub.attributes
        @hsubhash['average'] = sub.risyuritsu(params[:gakunen].to_i)
        @hsubhash.delete('created_at')
        @hsubhash.delete('updated_at')
        @hsubhash.delete('id')
        @hsubhash.delete('cs_comp')
        @h << @hsubhash
      end
    end

    @a = least_recommend(params[:gakunen].to_i,"総合A群","選択",params[:a_credit].to_i)
    @b = least_recommend(params[:gakunen].to_i,"総合B群","選択",params[:b_credit].to_i)
    @c = least_recommend(params[:gakunen].to_i,"総合C群","選択",params[:c_credit].to_i)
    @k1 = least_recommend(params[:gakunen].to_i,"基礎専門","必修",params[:k1_credit].to_i)
    @k2 = least_recommend(params[:gakunen].to_i,"基礎専門","選択必修",params[:k2_credit].to_i)
    @k3 = least_recommend(params[:gakunen].to_i,"基礎専門","選択",params[:k3_credit].to_i)
    @s1 = least_recommend(params[:gakunen].to_i,"専門","必修",params[:s1_credit].to_i)
    @s2 = least_recommend(params[:gakunen].to_i,"専門","選択必修",params[:s2_credit].to_i)
    @s3 = least_recommend(params[:gakunen].to_i,"専門","選択",params[:s3_credit].to_i)

    @subarray = [@culs]
    @subarray << @h if @h
    @subarray << @a if @a
    @subarray << @b if @b
    @subarray << @c if @c
    @subarray << @k1 if @k1
    @subarray << @k2 if @k2
    @subarray << @k3 if @k3
    @subarray << @s1 if @s1
    @subarray << @s2 if @s2
    @subarray << @s3 if @s3
    render :json => @subarray
    # render :json => @curriculums,:include => [:user,:subjects]
    # render :json => @curriculums,:include => {:user => {:only => :user_name}},:only => [:lank,:explain]
    # render :json => @subarray,:only => [:sub_name,:kubun,:ip_comp]
    # render 'search/list'
  end  

  def least_recommend(gakunen,kubun,hitsusen,credit)
    # 学年と区分を入力し，単位が不足していたら，その区分の科目を取得
    least = least_calc(gakunen,kubun,hitsusen,credit)
    if least > 0
      @subs = []
      @subjects = kubun(gakunen,kubun,hitsusen).select('sub_name,year,period,part,credit')
      @subjects.each do|sub|
        #average = sub.risyuritsu(gakunen)
        #if average > 60
          @suba = sub.attributes
          #@suba['average'] = average
          @subs << @suba
        #end
      end
      @kubunhash = {"kubun" => kubun,"ip_comp" => hitsusen,"least" => least,"subjects" => @subs}
      return @kubunhash
    else
      nil
    end
  end

  def least_calc(gakunen,kubun,hitsusen,credit)
    # 学年と区分，単位数を引数に取って，
    # 不足単位数を計算し，返す．

    @norma_array = [[8,8,10,12],[8,12,12,12],[2,4,4,4],[8,8,8,8],[12,14,18,18],[4,4,4,4],[2,6,14,14],[0,16,20,24],[0,10,20,32]]
    if kubun == '総合A群'
      tate = 0
    elsif kubun == '総合B群'
      tate = 1
    elsif kubun == '総合C群'
      tate = 2
    elsif kubun == '基礎専門'
      case hitsusen
      when '必修' then
        tate = 3
      when '選択必修' then
        tate = 4
      when '選択' then
        tate = 5
      end
    elsif kubun == '専門'
      case hitsusen
      when '必修' then
        tate = 6
      when '選択必修' then
        tate = 7
      when '選択' then
        tate = 8
      end
    end 
       
    case gakunen
    when 1
      norma = @norma_array[tate][0]
    when 2
      norma = @norma_array[tate][1]
    when 3
      norma = @norma_array[tate][2]
    when 4
      norma = @norma_array[tate][3]
    end
    @least = norma-credit
    if @least > 0
      return @least.to_i
    else 
      return 0
    end
  end

  def credit_recommend(gakunen,kubun,hitsusen)
    # 学年，区分を引数に取り，科目検索
    Subject.where('kubun = ? AND ip_comp = ? AND year = ?',kubun,hitsusen,gakunen)
  end

  def least_calc_render
    # 単一計算用
    # @least を返しテンプレートに表示
    least_calc(params[:kubun],params[:hitsusen],params[:gakunen].to_i,params[:credit].to_i)
  end

  def kubun_all_render
    # 全区分計算用
    @a_least = least_calc("総合A群","選択",params[:gakunen].to_i,params[:a_credit].to_i)
    @a_recommend = credit_recommend(@a_least,"総合A群","選択",params[:gakunen].to_i)
    @b_least = least_calc("総合B群","選択",params[:gakunen].to_i,params[:b_credit].to_i)
    @c_least = least_calc("総合C群","選択",params[:gakunen].to_i,params[:c_credit].to_i)
    @k1_least = least_calc("基礎専門","必修",params[:gakunen].to_i,params[:k1_credit].to_i)
    @k2_least = least_calc("基礎専門","選択必修",params[:gakunen].to_i,params[:k2_credit].to_i)
    @k3_least = least_calc("基礎専門","選択",params[:gakunen].to_i,params[:k3_credit].to_i)
    @s1_least = least_calc("専門","必修",params[:gakunen].to_i,params[:s1_credit].to_i)
    @s2_least = least_calc("専門","選択必修",params[:gakunen].to_i,params[:s2_credit].to_i)
    @s3_least = least_calc("専門","選択",params[:gakunen].to_i,params[:s3_credit].to_i)
  end

  def tomodachi
  end
end
