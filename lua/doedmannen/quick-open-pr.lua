local function open_github_pr_from_blame()
  -- This was built for github pull requests only and assumes
  -- that you're using squash merge on PRs

  -- Get current working directory and extract org/repo
  -- The location of your repos need to follow the structure /repos/organisation-or-user/repo-name
  local cwd = vim.fn.getcwd()
  local org, repo = cwd:match(".*/repos/([^/]+)/([^/]+)")

  if not org or not repo then
    print("Error: Current repo location is not accepted, needs to follow repos/org-or-user/repo-name")
    return
  end

  -- Get commit hash from git blame for current line
  local line_num = vim.fn.line('.') -- gets the current line number
  local file_path = vim.fn.expand('%:p') -- gets the full path (:p) of the current buffer (%)

  local git_cmd = string.format("git blame -L %d,%d --porcelain %s", line_num, line_num, file_path)
  local handle = io.popen(git_cmd)
  local blame_output = handle:read("*a")
  handle:close()

  local commit_hash = blame_output:match("^(%w+)")

  if commit_hash then
    -- Get commit message subject (first line of commit message)
    local msg_cmd = string.format("git show --format=%%s --no-patch %s", commit_hash)
    local msg_handle = io.popen(msg_cmd)
    local commit_message = msg_handle:read("*a")
    msg_handle:close()

    -- Extract PR number
    local pr_number = commit_message:match("#(%d+)") or commit_message:match("%((%d+)%)")

    if pr_number then
      local github_url = string.format("https://github.com/%s/%s/pull/%s", org, repo, pr_number)
      print("Opening PR: " .. github_url)

      -- Open URL
      local open_cmd = vim.fn.has('mac') == 1 and 'open' or 'xdg-open' -- Probably not supporting windows but that can be fixed
      os.execute(open_cmd .. ' "' .. github_url .. '"')
    else
      print("No PR number found in commit: " .. commit_message:gsub("\n", " "))
    end
  end
end

-- Create user commands
vim.api.nvim_create_user_command('GitHubPRBlame', open_github_pr_from_blame, {})

-- Key mappings
vim.keymap.set('n', '<leader>gpr', open_github_pr_from_blame, { desc = 'Open GitHub PR from current line blame' })

return {
  open_github_pr_from_blame = open_github_pr_from_blame,
}
