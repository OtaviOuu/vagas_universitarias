defmodule VagasUniversitariasWeb.AshJsonApiRouter do
  use AshJsonApi.Router,
    domains: [VagasUniversitarias.Vagas],
    open_api: "/open_api"
end
