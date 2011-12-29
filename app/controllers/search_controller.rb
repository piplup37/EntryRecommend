# coding: utf-8

class SearchController < ApplicationController
	
  def period
    @subjects = Subject.where('period = ? AND year <= ?',params[:period],current_user.lank).kouki
    @hsubs = senpai(@subjects,current_user.lank)
    @friends = current_user.friend_ids
    @friend_entries = Entry.where(:user_id => @friends).includes("subject").merge(Subject.kouki.where('subjects.period = ?',params[:period]))
  end

  def senpai(subjects,gakunen)
    hsubjects = []
    subjects.each do |sub|
      if sub.risyuritsu(gakunen) >= 60
        hsubjects << sub
      end
    end
    return hsubjects
  end

  def list
    @subjects = Subject.where('year = ?',2)
  end

  def kubun(gakunen,kubun,hitsusen)
    subjects = Subject.where('ip_comp = ? AND kubun = ? AND year <= ?',hitsusen,kubun,gakunen).order('year ASC')
    return subjects
  end

  def test
    @subjects = kubun(params[:hitsusen],params[:kubun],params[:gakunen])
    render 'list'
  end

end
