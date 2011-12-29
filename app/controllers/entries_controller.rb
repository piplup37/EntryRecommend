# coding: utf-8

class EntriesController < RecommendController

  def index
    @m1 = Subject.jigen("月曜1限").includes("entries").where('entries.user_id = ?',current_user).first
    @m2 = Subject.jigen("月曜2限").includes("entries").where('entries.user_id = ?',current_user).first
    @m3 = Subject.jigen("月曜3限").includes("entries").where('entries.user_id = ?',current_user).first
    @m4 = Subject.jigen("月曜4限").includes("entries").where('entries.user_id = ?',current_user).first
    @m5 = Subject.jigen("月曜5限").includes("entries").where('entries.user_id = ?',current_user).first
    @tue1 = Subject.jigen("火曜1限").includes("entries").where('entries.user_id = ?',current_user).first
    @tue2 = Subject.jigen("火曜2限").includes("entries").where('entries.user_id = ?',current_user).first
    @tue3 = Subject.jigen("火曜3限").includes("entries").where('entries.user_id = ?',current_user).first
    @tue4 = Subject.jigen("火曜4限").includes("entries").where('entries.user_id = ?',current_user).first
    @tue5 = Subject.jigen("火曜5限").includes("entries").where('entries.user_id = ?',current_user).first
    @w1 = Subject.jigen("水曜1限").includes("entries").where('entries.user_id = ?',current_user).first
    @w2 = Subject.jigen("水曜2限").includes("entries").where('entries.user_id = ?',current_user).first
    @w3 = Subject.jigen("水曜3限").includes("entries").where('entries.user_id = ?',current_user).first
    @w4 = Subject.jigen("水曜4限").includes("entries").where('entries.user_id = ?',current_user).first
    @w5 = Subject.jigen("水曜5限").includes("entries").where('entries.user_id = ?',current_user).first
    @tur1 = Subject.jigen("木曜1限").includes("entries").where('entries.user_id = ?',current_user).first
    @tur2 = Subject.jigen("木曜2限").includes("entries").where('entries.user_id = ?',current_user).first
    @tur3 = Subject.jigen("木曜3限").includes("entries").where('entries.user_id = ?',current_user).first
    @tur4 = Subject.jigen("木曜4限").includes("entries").where('entries.user_id = ?',current_user).first
    @tur5 = Subject.jigen("木曜5限").includes("entries").where('entries.user_id = ?',current_user).first
    @f1 = Subject.jigen("金曜1限").includes("entries").where('entries.user_id = ?',current_user).first
    @f2 = Subject.jigen("金曜2限").includes("entries").where('entries.user_id = ?',current_user).first
    @f3 = Subject.jigen("金曜3限").includes("entries").where('entries.user_id = ?',current_user).first
    @f4 = Subject.jigen("金曜4限").includes("entries").where('entries.user_id = ?',current_user).first
    @f5 = Subject.jigen("金曜5限").includes("entries").where('entries.user_id = ?',current_user).first
    @subjects = Subject.all
  end

  def subject_index
    @subjects = Subject.all
  end

  def create
    @entry = Entry.new
    @entry.user_id = current_user.id
    @entry.subject_id = params[:entry_subject]
    
    respond_to do |format|
      if @entry.save
        format.html { redirect_to entries_path, notice: 'Entry was successfully created.' }
        format.json { render json: entries_path, status: :created, location: @score }
      else
        format.html { render action: "new" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :ok }
    end
  end

  def release
    @subject = Subject.find(params[:release_subject])
    @user = current_user
    @entry = Entry.where('user_id = ? AND subject_id = ?',@user,@subject)
    @subject.entries.destroy(@entry)

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :ok }
    end
  end

end
