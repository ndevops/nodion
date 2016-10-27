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

Plan.create(name: '1GB', ram: '1 GB', cpu: '1 Core', storage: '20 GB', storage_type: 'SSD')
Plan.create(name: '2GB', ram: '2 GB', cpu: '2 Cores', storage: '40 GB', storage_type: 'SSD')

Region.create(name: 'FRA1')
Region.create(name: 'AMS1')
