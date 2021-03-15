User
has_many :artists
has_many :photocards
has_many :albums, through: :artists
has_secure_password

name - string
email - string
password - string


Artist
belongs_to :user
has_many :photocards
<!-- has_many :users, through: :photocards-->
belongs_to :album

name - string
birthday - date
age - integer (field or method?)
stagename and/or groupname - string
position - string
company - string
notes - string


Photocard
belongs_to :user
belongs_to :artist

title - string
print_type - string
source_type - string
source_name - string
card_type - sting
notes - string
card_num? - integer



Album
has_many :artists
has_many :users, through: :artists
has_many :photocards, through: :artists
name - string



Things to Do:
* Check user auth :has secure password
* fix user validation on artist/photocard deletions
* hide edit & delete if not the owner
* Need to create public view of artists
* Fix the birthday displayed on artists show
* Fix show/index redirects to see our own items
