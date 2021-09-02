# This repo is used to demonstrate issue in rails with `#connects_to`

In `master` branch there is an absolutely new rails app.
I added `Test` model and added `connects_to database: { writing: :primary }` to `ApplicationRecord`.
That causes issue if you try to use `Test` model in migration (SQLite and PostgreSQL). More likely it's the same issue as described in https://github.com/rails/rails/issues/42873.

Demo with PostgreSQL is available in `postgresql` branch.

Migration output (SQLite):

```
rails db:migrate
== 20210902123153 CreateTests: migrating ======================================
-- create_table(:tests)
   -> 0.0032s
== 20210902123153 CreateTests: migrated (0.0062s) =============================

rails aborted!
StandardError: An error has occurred, this and all later migrations canceled:

prepare called on a closed database
rails-connects-to-issue/bin/rails:5:in `<top (required)>'
rails-connects-to-issue/bin/spring:10:in `require'
rails-connects-to-issue/bin/spring:10:in `block in <top (required)>'
rails-connects-to-issue/bin/spring:7:in `tap'
rails-connects-to-issue/bin/spring:7:in `<top (required)>'

Caused by:
ActiveRecord::ConnectionNotEstablished: prepare called on a closed database
rails-connects-to-issue/bin/rails:5:in `<top (required)>'
rails-connects-to-issue/bin/spring:10:in `require'
rails-connects-to-issue/bin/spring:10:in `block in <top (required)>'
rails-connects-to-issue/bin/spring:7:in `tap'
rails-connects-to-issue/bin/spring:7:in `<top (required)>'

Caused by:
ArgumentError: prepare called on a closed database
rails-connects-to-issue/bin/rails:5:in `<top (required)>'
rails-connects-to-issue/bin/spring:10:in `require'
rails-connects-to-issue/bin/spring:10:in `block in <top (required)>'
rails-connects-to-issue/bin/spring:7:in `tap'
rails-connects-to-issue/bin/spring:7:in `<top (required)>'

Caused by:
ActiveRecord::ConnectionNotEstablished: prepare called on a closed database
rails-connects-to-issue/bin/rails:5:in `<top (required)>'
rails-connects-to-issue/bin/spring:10:in `require'
rails-connects-to-issue/bin/spring:10:in `block in <top (required)>'
rails-connects-to-issue/bin/spring:7:in `tap'
rails-connects-to-issue/bin/spring:7:in `<top (required)>'

Caused by:
ArgumentError: prepare called on a closed database
rails-connects-to-issue/bin/rails:5:in `<top (required)>'
rails-connects-to-issue/bin/spring:10:in `require'
rails-connects-to-issue/bin/spring:10:in `block in <top (required)>'
rails-connects-to-issue/bin/spring:7:in `tap'
rails-connects-to-issue/bin/spring:7:in `<top (required)>'
Tasks: TOP => db:migrate
(See full trace by running task with --trace)
```
