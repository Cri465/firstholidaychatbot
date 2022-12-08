module CoreExtensions
  module Hash
    ## first a version that modifies the receiver
    define_method '&=' do |other|
      self.delete_if{|k, v| other[k] != v }
    end

    ## (note that
    ##   def &=(other)
    ## is a syntax error: "unexpected operator assignment")
    ## now the version that simply returns the intersection
    def &(other)
      self.dup.send('&=', other)
    end
    ## (note that
    ##  self.dup &= other
    ## causes a "stack level too deep" error when the method is called)
  end
end

# fully yoinked from Andrew Blake
