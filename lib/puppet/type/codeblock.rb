Puppet::Type.newtype(:codeblock) do

  desc <<-EOT
    Run a codeblock instead of an exec
  EOT

  ensurable do
    defaultto :run
    newvalue(:run,:event => :codeblock_run) do
      provider.run
      return :codeblock_run
    end
  end

  newparam(:name, :name => true) do
    desc 'arbitrary name used as identity'
  end

  newparam(:code) do
    desc 'command to execute'
  end

end
