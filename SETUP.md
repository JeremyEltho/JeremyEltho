# 3D GitHub Profile Setup Guide

This repository contains everything needed to generate and display a 3D GitHub contribution graph.

## Quick Start

### Option 1: Manual Generation (One-time)

1. **Get a GitHub Token**
   - Go to [GitHub Settings > Personal Access Tokens](https://github.com/settings/tokens)
   - Click "Generate new token (classic)"
   - Select scopes:
     - `public_repo` (for public contributions only)
     - OR `repo` (to include private repository contributions)
   - Copy the generated token

2. **Set the Token**
   ```bash
   export GITHUB_TOKEN=your_token_here
   ```

3. **Generate the Graph**
   ```bash
   ./generate-3d-graph.sh
   ```

### Option 2: Automatic Updates (Recommended)

The GitHub Action in `.github/workflows/generate-3d-contrib.yml` will automatically:
- Run every Sunday at midnight UTC
- Generate updated 3D contribution graphs
- Commit the new images to your repository

**No additional setup required!** The action uses the built-in `GITHUB_TOKEN` automatically.

## Generated Files

The script generates multiple styles in the `assets/` folder:

- `profile-night-rainbow.svg` - Main file (night rainbow theme)
- `profile-green-animate.svg` - Green with animation
- `profile-green.svg` - Green static
- `profile-season-animate.svg` - Seasonal colors with animation
- `profile-season.svg` - Seasonal colors static
- `profile-night-view.svg` - Dark theme
- `profile-night-green.svg` - Dark with green
- `profile-night-rainbow.svg` - Dark with rainbow
- `profile-gitblock.svg` - Block style

## Customizing Your Graph

You can modify the graph generation by:

1. **Changing the style** - Edit the copy commands in `generate-3d-graph.sh` to use a different default style
2. **Custom settings** - Create a settings JSON file (see `github-profile-3d-contrib/sample-settings/`)
3. **Different schedule** - Modify the cron schedule in `.github/workflows/generate-3d-contrib.yml`

## Troubleshooting

### Common Issues

1. **Token not working**
   - Make sure the token has the right permissions
   - For private repos, use a personal access token instead of the default `GITHUB_TOKEN`

2. **No files generated**
   - Check that your GitHub username "JeremyEltho" is correct
   - Ensure you have public contributions on GitHub

3. **Action failing**
   - Check the Actions tab in your GitHub repository for error details
   - The default `GITHUB_TOKEN` should work for public repositories

### Manual Testing

Test the generation locally:
```bash
cd github-profile-3d-contrib
npm install
npm run build
export GITHUB_TOKEN=your_token
node . JeremyEltho
```

## Credits

- 3D Graph Generator: [github-profile-3d-contrib](https://github.com/yoshi389111/github-profile-3d-contrib) by [@yoshi389111](https://github.com/yoshi389111)
- Inspiration: Making GitHub profiles more visually appealing!
