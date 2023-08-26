# Kills a process name killmenow

exec { 'pkill killmenow':
  path     => ['/usr/bin', '/usr/sbin'],
  command  => 'pkill killmenow',
  provider => shell,
  returns  => [0, 1]
}
