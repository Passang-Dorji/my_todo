defmodule MyTodo.CommentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyTodo.Comments` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> MyTodo.Comments.create_comment()

    comment
  end
end
