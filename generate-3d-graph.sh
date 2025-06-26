#!/bin/bash

# GitHub Profile 3D Contrib Generator
# This script helps generate your 3D GitHub contribution graph

echo "GitHub Profile 3D Contrib Generator"
echo "======================================"

# Check if GITHUB_TOKEN is set
if [ -z "$GITHUB_TOKEN" ]; then
    echo "GITHUB_TOKEN environment variable is not set."
    echo ""
    echo "To generate your 3D contribution graph, you need a GitHub Personal Access Token."
    echo ""
    echo "Follow these steps:"
    echo "1. Go to https://github.com/settings/tokens"
    echo "2. Click 'Generate new token (classic)'"
    echo "3. Select scopes: 'public_repo' (for public contributions)"
    echo "   OR 'repo' (if you want to include private repository contributions)"
    echo "4. Copy the generated token"
    echo "5. Run: export GITHUB_TOKEN=your_token_here"
    echo "6. Then run this script again"
    echo ""
    echo "For security, you can also create a .env file with:"
    echo "GITHUB_TOKEN=your_token_here"
    echo ""
    exit 1
fi

echo "GITHUB_TOKEN is set"
echo "Generating 3D contribution graph for JeremyEltho..."

# Navigate to the tool directory
cd github-profile-3d-contrib

# Generate the 3D contribution graph
node . JeremyEltho

# Check if generation was successful
if [ $? -eq 0 ]; then
    echo "3D contribution graph generated successfully!"
    
    # Copy the generated SVG files to assets folder
    if [ -d "profile-3d-contrib" ]; then
        echo "Copying generated files to assets folder..."
        cp profile-3d-contrib/profile-*.svg ../assets/ 2>/dev/null || true
        
        # Use the night rainbow version as the main one
        if [ -f "profile-3d-contrib/profile-night-rainbow.svg" ]; then
            cp profile-3d-contrib/profile-night-rainbow.svg ../assets/profile-night-rainbow.svg
            echo "Main 3D graph saved as assets/profile-night-rainbow.svg"
        elif [ -f "profile-3d-contrib/profile-green-animate.svg" ]; then
            cp profile-3d-contrib/profile-green-animate.svg ../assets/profile-night-rainbow.svg
            echo "Main 3D graph saved as assets/profile-night-rainbow.svg"
        elif [ -f "profile-3d-contrib/profile-green.svg" ]; then
            cp profile-3d-contrib/profile-green.svg ../assets/profile-night-rainbow.svg
            echo "Main 3D graph saved as assets/profile-night-rainbow.svg"
        fi
        
        echo "Available styles copied to assets:"
        ls -la ../assets/profile-*.svg 2>/dev/null || echo "No additional profile files found"
    else
        echo "No profile-3d-contrib folder found. Generation may have failed."
    fi
else
    echo "Failed to generate 3D contribution graph"
    exit 1
fi

echo ""
echo "Done! Your 3D contribution graph is ready."
echo "Main file: assets/profile-night-rainbow.svg"
echo "It's already linked in your README.md"
