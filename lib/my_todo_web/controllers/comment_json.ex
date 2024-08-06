defmodule MyTodoWeb.CommentJSON do
  alias MyTodo.Comments.Comment

  @doc """
  Renders a list of comments.
  """
  def index(%{comments: comments}) do
    %{data: for(comment <- comments, do: data(comment))}
  end

  @doc """
  Renders a single comment.
  """
  def show(%{comment: comment}) do
    %{data: data(comment)}
  end

  defp data(%Comment{} = comment) do
    %{
      id: comment.id,
      content: comment.content,
      userId: comment.user_id,
      postId: comment.post_id
    }
  end
end
