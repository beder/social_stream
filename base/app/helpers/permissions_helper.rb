module PermissionsHelper
  DEFAULT_PERMISSIONS =
    [
      [ "read",    "activity" ],
      [ "create",  "activity" ],
      [ "follow", nil ],
      [ "represent", nil ]
    ]

  def default_permissions
    @default_permissions ||=
      DEFAULT_PERMISSIONS.map{ |a,o|
        Permission.find_or_create_by(action: a, object: o)
      }
  end
end
