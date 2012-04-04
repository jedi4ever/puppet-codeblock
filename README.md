## Experiment to execute an arbitrary codeblock in puppet

It's inspired on ruby_block in chef. It feels handy . But I might be totally wrong
Or so it brings a bit chef into puppet.

    codeblock { "stuff we do around here":
      code => 'puts "blabla"'
    }


Or use a template as a code file

    codeblock { "template stuff we do around here":
      provider => 'ruby',
      code     => template("mymodule/awesome.rb")
    }

**Highly experimental..**
