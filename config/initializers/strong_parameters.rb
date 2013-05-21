# Protect all Active Record resources by default.
ActiveRecord::Base.send(:include, ActiveModel::ForbiddenAttributesProtection)
