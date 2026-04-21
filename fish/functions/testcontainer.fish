function testcontainer
    set project_path $argv[1]
    set command (string join ' ' $argv[2..-1])

    # default to local dir
    if test -z "$project_path"
        set project_path "."
    end
    set project_path (realpath $project_path)

    # Default command is bash if none provided
    if test -z "$command"
        set command bash
    end

    # Verify Dockerfile exists
    set dockerfile "$project_path/.devcontainer/Dockerfile"
    if not test -f $dockerfile
        echo "Error: No Dockerfile found at $dockerfile"
        return 1
    end

    # Derive image name from folder name
    set image_name (string lower (basename $project_path)-devcontainer)

    echo "🔧 Building image '$image_name' from $dockerfile..."
    docker build -t $image_name -f $dockerfile $project_path

    if test $status -ne 0
        echo "❌ Build failed."
        return 1
    end

    # fix dubious ownership problems, but silently fail if git does not exist
    # then runs the other desired command
    set start_command bash -c \
        "( command -v git >/dev/null && git config --global --add safe.directory /workspace ); \
        $command"

    echo "🐳 Running container..."
    docker run -it --rm -v $project_path:/workspace -w /workspace $image_name $start_command
end
