# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ubuntu = Distribution.create(name: 'Ubuntu')
debian = Distribution.create(name: 'Debian')
centos = Distribution.create(name: 'CentOS')
freebsd = Distribution.create(name: 'FreeBSD')

Image.create(name: 'Ubuntu 16.04', version: '16.04', distribution_id: ubuntu.id)
Image.create(name: 'Ubuntu 14.04', version: '16.04', distribution_id: ubuntu.id)

Plan.create(name: '1GB')
Plan.create(name: '2GB')

Region.create(name: 'FRA1')
Region.create(name: 'AMS1')
