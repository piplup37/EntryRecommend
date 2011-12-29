# coding: utf-8
class ScoreviewController < RecommendController
  def users_score
    @sougouA =  Score.where(:user_id => current_user).includes("subject").where("subjects.kubun = '総合A群'")
    @sougouB =  Score.where(:user_id => current_user).includes("subject").where("subjects.kubun = '総合B群'")
    @sougouC =  Score.where(:user_id => current_user).includes("subject").where("subjects.kubun = '総合C群'")
    @kisosen_hissyu = Score.where(:user_id => current_user).includes("subject").where("subjects.kubun = '基礎専門' AND subjects.ip_comp = '必修'")
    @kisosen_senhitsu = Score.where(:user_id => current_user).includes("subject").where("subjects.kubun = '基礎専門' AND subjects.ip_comp = '選択必修'")
    @kisosen_sentaku = Score.where(:user_id => current_user).includes("subject").where("subjects.kubun = '基礎専門' AND subjects.ip_comp = '選択'")
    @senmon_hissyu = Score.where(:user_id => current_user).includes("subject").where("subjects.kubun = '専門' AND subjects.ip_comp = '必修'")
    @senmon_senhitsu = Score.where(:user_id => current_user).includes("subject").where("subjects.kubun = '専門' AND subjects.ip_comp = '選択必修'")
    @senmon_sentaku = Score.where(:user_id => current_user).includes("subject").where("subjects.kubun = '専門' AND subjects.ip_comp = '選択'")
    @ea =  Entry.where(:user_id => current_user).includes("subject").where("subjects.kubun = '総合A群'")
    @eb =  Entry.where(:user_id => current_user).includes("subject").where("subjects.kubun = '総合B群'")
    @ec =  Entry.where(:user_id => current_user).includes("subject").where("subjects.kubun = '総合C群'")
    @ek1 = Entry.where(:user_id => current_user).includes("subject").where("subjects.kubun = '基礎専門' AND subjects.ip_comp = '必修'")
    @ek2 = Entry.where(:user_id => current_user).includes("subject").where("subjects.kubun = '基礎専門' AND subjects.ip_comp = '選択必修'")
    @ek3 = Entry.where(:user_id => current_user).includes("subject").where("subjects.kubun = '基礎専門' AND subjects.ip_comp = '選択'")
    @es1 = Entry.where(:user_id => current_user).includes("subject").where("subjects.kubun = '専門' AND subjects.ip_comp = '必修'")
    @es2 = Entry.where(:user_id => current_user).includes("subject").where("subjects.kubun = '専門' AND subjects.ip_comp = '選択必修'")
    @es3 = Entry.where(:user_id => current_user).includes("subject").where("subjects.kubun = '専門' AND subjects.ip_comp = '選択'")
    @asum = credit_sum(@sougouA)
    @bsum = credit_sum(@sougouB)
    @csum = credit_sum(@sougouC)
    @k1sum = credit_sum(@kisosen_hissyu)
    @k2sum = credit_sum(@kisosen_senhitsu)
    @k3sum = credit_sum(@kisosen_sentaku)
    @s1sum = credit_sum(@senmon_hissyu)
    @s2sum = credit_sum(@senmon_senhitsu)
    @s3sum = credit_sum(@senmon_sentaku)
    @easum = credit_sum(@ea)
    @ebsum = credit_sum(@eb)
    @ecsum = credit_sum(@ec)
    @ek1sum = credit_sum(@ek1)
    @ek2sum = credit_sum(@ek2)
    @ek3sum = credit_sum(@ek3)
    @es1sum = credit_sum(@es1)
    @es2sum = credit_sum(@es2)
    @es3sum = credit_sum(@es3)
    # 不足単位計算，不足の時科目を検索（search/kubun），履修or修得済みかチェック，まだなら推薦して単位数を加算，
    @a_least = least_calc(current_user.lank,"総合A群","選択",@asum+@easum)
    @a_least_recommend = kubun(current_user.lank,"総合A群","選択") if @a_least > 0
    @b_least = least_calc(current_user.lank,"総合B群","選択",@bsum+@ebsum)
    @b_least_recommend = kubun(current_user.lank,"総合B群","選択") if @b_least > 0
    @c_least = least_calc(current_user.lank,"総合C群","選択",@csum+@ecsum)
    @c_least_recommend = kubun(current_user.lank,"総合C群","選択") if @c_least > 0
    @k1_least = least_calc(current_user.lank,"基礎専門","必修",@k1sum+@ek1sum)
    @k1_least_recommend = kubun(current_user.lank,"基礎専門","必修") if @k1_least > 0
    @k2_least = least_calc(current_user.lank,"基礎専門","選択必修",@k2sum+@ek2sum)
    @k2_least_recommend = kubun(current_user.lank,"基礎専門","選択必修") if @k2_least > 0
    @k3_least = least_calc(current_user.lank,"基礎専門","選択",@k3sum+@ek3sum)
    @k3_least_recommend = kubun(current_user.lank,"基礎専門","選択") if @k3_least > 0
    @s1_least = least_calc(current_user.lank,"専門","必修",@s1sum+@es1sum)
    @s1_least_recommend = kubun(current_user.lank,"専門","必修") if @s1_least > 0
    @s2_least = least_calc(current_user.lank,"専門","選択必修",@s2sum+@es2sum)
    @s2_least_recommend = kubun(current_user.lank,"専門","選択必修") if @s2_least > 0
    @s3_least = least_calc(current_user.lank,"専門","選択",@s3sum+@es3sum)
    @s3_least_recommend = kubun(current_user.lank,"専門","選択") if @s3_least > 0
  end

  def score_recommend(gakunen,kubun,hitsusen)
  end

  def credit_sum(array)
    sum = 0
    array.each{|e| sum += e.subject.credit}
    return sum
  end
end
