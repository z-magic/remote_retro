defmodule RemoteRetro.UserTest do
  use RemoteRetro.ModelCase

  alias RemoteRetro.User

  @valid_attrs %{
    email: "mistertestuser@gmail.com",
    google_user_info: %{test: "one two"},
    family_name: "Vander Hoop",
    given_name: "Travis",
    locale: "en",
    name: "Test User",
    picture: "https://lh6.googleusercontent.com/-cZI40d8YpIQ/AAAAAAAAAAI/AAAAAAAAABs/gmDI7LQ2Lo0/photo.jpg?sz=50",
    profile: "https://plus.google.com/108658712426577966861",
    last_login: ~N[2010-04-03 23:00:07]
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "valid changeset when optional fields are absent" do
    attrs_minus_family_name = Map.drop(@valid_attrs, [:family_name])

    changeset = User.changeset(%User{}, attrs_minus_family_name)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "the valid inclusion of a virtual, unpersisted `online_at` attribute" do
    user = %User{email: "monsieur@misspellingsarefine.com"}
    assert %User{user | online_at: 393939393939}
  end

  test "the valid inclusion of a virtual, unpersisted `token` attribute" do
    user = %User{email: "monsieur@misspellingsarefine.com"}
    assert %User{user | token: "abc987zyx"}
  end
end
