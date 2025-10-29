defmodule VagasUniversitarias.Vagas.Calculations.CentavosToReais do
  use Ash.Resource.Calculation

  def load(_query, _opts, _context) do
    []
  end

  def calculate(records, _opts, _context) do
    Enum.map(records, fn record ->
      case Map.get(record, :salario_centavos) do
        nil ->
          nil

        valor ->
          Decimal.div(Decimal.new(valor), Decimal.new(100))
      end
    end)
  end
end
