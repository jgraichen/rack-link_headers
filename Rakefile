# frozen_string_literal: true

require 'rake/release/task'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push 'test'
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

task default: :test

Rake::Release::Task.new do |spec|
  spec.sign_tag = true
end
