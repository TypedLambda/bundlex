defmodule Bundlex.Toolchain.XCode do
  @moduledoc false

  use Bundlex.Toolchain
  alias Bundlex.Toolchain.Common.Unix

  def compiler_commands(native) do
    {cflags, lflags} =
      case native.type do
        :nif -> {"-fPIC", "-dynamiclib -undefined dynamic_lookup"}
        _ -> {"", ""}
      end

    Unix.compiler_commands(native, "cc #{cflags}", "cc #{lflags}")
  end
end
