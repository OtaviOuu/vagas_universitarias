defmodule VagasUniversitarias.Vagas.Calculations.InsertedAtFormated do
  use Ash.Resource.Calculation

  def load(_query, _opts, _context) do
    []
  end

  def calculate(records, _opts, _context) do
    Enum.map(records, fn record ->
      case Map.get(record, :inserted_at) do
        nil ->
          nil

        raw_data ->
          DateTime.to_date(raw_data)
      end
    end)
  end
end
