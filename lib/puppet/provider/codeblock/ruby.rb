Puppet::Type.type(:codeblock).provide(:ruby) do

  def exists?
    true
  end

  def boolean?(result)
    result.is_a?(TrueClass) || result.is_a?(FalseClass)
  end

  def run
    begin
      code = resource[:code]
      Puppet.debug("Executing: #{code}")
      result, output = eval("
      begin
        $stdout = StringIO.new;
        block_result = #{code};
        [ block_result, $stdout.string ]
       ensure
        $stdout = STDOUT
       end")
       Puppet.debug("Output was: #{output}")
       Puppet.debug("Result boolean? : #{boolean?(result)}")
    rescue Exception => detail
      raise Puppet::Error, detail
    end
  end
end
