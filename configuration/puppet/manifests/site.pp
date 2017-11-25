node 'sam-test' {
 file { '/tmp/hello':
      content =>"Helloworld",
      }
}
node 'mongodb0' {
     include motd

}
node 'devil.ipvbd.com' {
     include motd
}

