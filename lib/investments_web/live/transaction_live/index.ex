defmodule InvestmentsWeb.TransactionLive.Index do
  use InvestmentsWeb, :live_view

  alias Investments.Core
  alias Investments.Core.Transaction

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :transactions, list_transactions())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Transaction")
    |> assign(:transaction, Core.get_transaction!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Transaction")
    |> assign(:transaction, %Transaction{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Transactions")
    |> assign(:transaction, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    transaction = Core.get_transaction!(id)
    {:ok, _} = Core.delete_transaction(transaction)

    {:noreply, assign(socket, :transactions, list_transactions())}
  end

  defp list_transactions do
    Core.list_transactions()
  end
end
