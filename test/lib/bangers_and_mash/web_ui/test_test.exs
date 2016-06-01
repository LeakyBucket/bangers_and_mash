defmodule BangersAndMash.WebUI.TestTest do
  use ExUnit.Case
  alias BangersAndMash.WebUI.Step
  alias BangersAndMash.WebUI.Action
  alias BangersAndMash.WebUI.Acceptance
  alias BangersAndMash.WebUI.Test

  @steps [
    %Step{
      name: "login",
      actions: [
        %Action{action: :fill, target: {:id, "username"}, data: "Me"},
        %Action{action: :fill, target: {:id, "password"}, data: "Pass"},
        %Action{action: :submit, target: {:id, "password"}}
      ]
    },
    %Step{
      name: "click a link",
      actions: [
        %Action{action: :click, target: {:id, "link"}}
      ]
    }
  ]
  @test_name "UI Test"
  @acceptance %Acceptance{type: :is, target: {:id, "body"}, value: "text"}
  @non_acceptance %Acceptance{type: :is_not, target: {:id, "body"}, value: "no text"}
  @test %Test{name: @test_name, steps: @steps}

  test "writing an exs file for a test" do
    Application.put_env(:bangers_and_mash, :persist_strategy, BangersAndMash.Storage.Filesystem)

    assert {:ok, _} = Test.save(Kernel.struct(@test, acceptances: [@acceptance]))
  end

  test "module creation" do
    assert BangersAndMash.Browser.UITest = Test.to_module(@test)
    assert [run: 0] = BangersAndMash.Browser.UITest.__info__(:functions)
  end

  test "module with only steps" do
    assert String.contains?(Test.module_string(@test), "fill_field")
  end

  test "module with a single acceptance criteria" do
    acceptable = Kernel.struct(@test, acceptances: [@acceptance])

    assert String.contains?(Test.module_string(acceptable), "String.contains?(inner_html({:id, \"body\"}), \"text\")")
  end

  test "module with multiple acceptance criteria" do
    acceptable = Kernel.struct(@test, acceptances: [@acceptance, @non_acceptance])
    mod_string = Test.module_string(acceptable)

    assert String.contains?(mod_string, "String.contains?(inner_html({:id, \"body\"}), \"text\")")
    assert String.contains?(mod_string, "&& !String.contains?(inner_html({:id, \"body\"}), \"no text\")")
  end
end
