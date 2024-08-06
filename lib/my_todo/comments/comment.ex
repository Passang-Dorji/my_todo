defmodule MyTodo.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :content, :string
    belongs_to :user,MyTodo.Accounts.User
    belongs_to :post,MyTodo.Posts.Post
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content, :user_id, :post_id])
    |> validate_required([:content, :user_id, :post_id])
  end
end
