class Api::V1::BaseSerializer < ActiveModel::Serializer

  # format all date fields
  def startdate
    format_date(object.startdate)
  end

  def enddate
    format_date(object.enddate)
  end

  def created_at
    format_date(object.created_at)
  end
  
  def updated_at
    format_date(object.updated_at)
  end

  private

  def format_date(d)
    d.strftime('%a %b %d')
  end
end
