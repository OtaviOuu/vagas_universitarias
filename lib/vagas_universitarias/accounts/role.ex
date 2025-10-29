defmodule VagasUniversitarias.Accounts.Role do
  use Ash.Type.Enum, values: [:user, :admin, :moderator]
end
