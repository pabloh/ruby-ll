module LL
  ##
  # Class containing data of a lexer token's source line source as the raw data,
  # column, line number, etc.
  #
  # @!attribute [r] name
  #  The name of the input file.
  #  @return [String]
  #
  # @!attribute [r] data
  #  The raw input data.
  #  @return [String]
  #
  # @!attribute [r] line
  #  @return [Fixnum]
  #
  # @!attribute [r] column
  #  @return [Fixnum]
  #
  class SourceLine
    attr_reader :name, :data, :line, :column

    ##
    # @param [String] data
    # @param [Fixnum] line
    # @param [Fixnum] column
    # @param [String] name
    #
    def initialize(data, line = 1, column = 1, name = '(ruby)')
      @name   = name
      @data   = data
      @line   = line
      @column = column
    end

    ##
    # @return [String]
    #
    def source_line
      return data.lines[line - 1][(column - 1)..-1]
    end

    ##
    # @return [TrueClass|FalseClass]
    #
    def ==(other)
      return false unless other.is_a?(self.class)

      return name == other.name &&
        data == other.data &&
        line == other.line &&
        column == other.column
    end
  end # SourceLine
end # LL
