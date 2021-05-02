defmodule InvestmentsWeb.InstrumentLive.Index do
  use InvestmentsWeb, :live_view

  alias Investments.Core
  alias Investments.Core.Instrument

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :instruments, list_instruments())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Instrument")
    |> assign(:instrument, Core.get_instrument!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Instrument")
    |> assign(:instrument, %Instrument{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Instruments")
    |> assign(:instrument, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    instrument = Core.get_instrument!(id)
    {:ok, _} = Core.delete_instrument(instrument)

    {:noreply, assign(socket, :instruments, list_instruments())}
  end

  defp list_instruments do
    Core.list_instruments()
  end
end
