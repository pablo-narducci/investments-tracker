defmodule InvestmentsWeb.InstrumentLive.FormComponent do
  use InvestmentsWeb, :live_component

  alias Investments.Core

  @impl true
  def update(%{instrument: instrument} = assigns, socket) do
    changeset = Core.change_instrument(instrument)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"instrument" => instrument_params}, socket) do
    changeset =
      socket.assigns.instrument
      |> Core.change_instrument(instrument_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"instrument" => instrument_params}, socket) do
    save_instrument(socket, socket.assigns.action, instrument_params)
  end

  defp save_instrument(socket, :edit, instrument_params) do
    case Core.update_instrument(socket.assigns.instrument, instrument_params) do
      {:ok, _instrument} ->
        {:noreply,
         socket
         |> put_flash(:info, "Instrument updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_instrument(socket, :new, instrument_params) do
    case Core.create_instrument(instrument_params) do
      {:ok, _instrument} ->
        {:noreply,
         socket
         |> put_flash(:info, "Instrument created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
