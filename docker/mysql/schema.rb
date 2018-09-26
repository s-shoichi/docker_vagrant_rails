# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do
  create_table 'users', id: :integer, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string   'name',            null: false
    t.string   'email',           null: false, index: { name: 'email', unique: true }
    t.string   'password_digest', null: false
    t.boolean  'activated',       default: false, null: false, comment: 'false:無効 true:有効'
    t.datetime 'created_at'
    t.datetime 'updated_at'

    t.index ['id'], name: 'id', unique: true
  end
end
