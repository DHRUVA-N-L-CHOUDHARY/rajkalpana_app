#!/bin/bash

# This script helps automate the creation of a new feature directory structure in a Flutter project.
# Usage: ./create_feature.sh feature_name [--widgets]

# Check if a feature name is provided
if [ -z "$1" ]; then
  echo "Error: No feature name provided."
  echo "Usage: ./create_feature.sh feature_name [--widgets]"
  exit 1
fi

# Get the feature name from the argument
feature_name=$1

# Ensure the feature name is a valid identifier (alphanumeric and underscores only)
if [[ ! "$feature_name" =~ ^[a-zA-Z_][a-zA-Z0-9_]*$ ]]; then
  echo "Error: Feature name must be alphanumeric and start with a letter or underscore."
  exit 1
fi

# Convert feature name to PascalCase for class names (e.g., phone_auth -> PhoneAuth)
pascal_case_feature_name=$(echo "$feature_name" | sed -r 's/(^|_)([a-z])/\U\2/g')

# Define the base path for features (customize if needed)
base_path="lib/features/$feature_name"

# Define paths for routing files
routes_file="lib/routes/app_routes.dart"
pages_file="lib/routes/app_pages.dart"

# Check if the feature already exists to avoid overwriting
if [ -d "$base_path" ]; then
  echo "Error: Feature '$feature_name' already exists."
  exit 1
fi

# Create the directory structure for the feature
mkdir -p "$base_path"/{controllers,views,bindings}

# Check if the --widgets flag is provided
if [[ "$2" == "--widgets" ]]; then
  mkdir -p "$base_path/widgets"
fi

# Create default files for the feature
controller_file="$base_path/controllers/${feature_name}_controller.dart"
view_file="$base_path/views/${feature_name}_view.dart"
binding_file="$base_path/bindings/${feature_name}_binding.dart"

# Populate the controller file with a basic GetX controller structure
cat <<EOL > "$controller_file"
import 'package:get/get.dart';

class ${pascal_case_feature_name}Controller extends GetxController {
  // TODO: Add controller properties and methods here
}
EOL

# Populate the view file with a basic GetX view structure
cat <<EOL > "$view_file"
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/${feature_name}_controller.dart';

class ${pascal_case_feature_name}View extends StatelessWidget {
  const ${pascal_case_feature_name}View ({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<${pascal_case_feature_name}Controller>(
      init: ${pascal_case_feature_name}Controller(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${pascal_case_feature_name} View'),
          ),
          body: Center(
            child: Text('${pascal_case_feature_name} is working'),
          ),
        );
      },
    );
  }
}
EOL

# Populate the binding file with a basic GetX binding structure
cat <<EOL > "$binding_file"
import 'package:get/get.dart';
import '../controllers/${feature_name}_controller.dart';

class ${pascal_case_feature_name}Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<${pascal_case_feature_name}Controller>(() => ${pascal_case_feature_name}Controller());
  }
}
EOL

# Add route constant to app_routes.dart if it doesn't already exist
if ! grep -q "static const ${feature_name^^} = _Paths.${feature_name^^};" "$routes_file"; then
  echo "Adding route to app_routes.dart..."
  sed -i "/class Routes {/,/}/ s/^\(\s*}\)/  static const ${feature_name^^} = _Paths.${feature_name^^};\n\1/" "$routes_file"
  sed -i "/abstract class _Paths {/,/}/ s|^\(\s*}\)|  static const ${feature_name^^} = '/${feature_name}';\n\1|" "$routes_file"
else
  echo "Route already exists in app_routes.dart"
fi

# Add GetPage to app_pages.dart if it doesn't already exist

# Add new static route constant in `AppPages` class if it doesn't exist
if ! grep -q "static const ${feature_name^^} = Routes.${feature_name^^};" "$pages_file"; then
  echo "Adding route constant to AppPages class..."
  # Find the last static constant in the class and add after it
  sed -i "$(grep -n 'static const [A-Z_]* = Routes\.[A-Z_]*;' "$pages_file" | tail -n 1 | cut -d: -f1)a\  static const ${feature_name^^} = Routes.${feature_name^^};" "$pages_file"
else
  echo "Route constant already exists in AppPages class"
fi


if ! grep -q "name: _Paths.${feature_name^^}," "$pages_file"; then
  echo "Adding GetPage to app_pages.dart..."
  import_line="import '../features/$feature_name/views/${feature_name}_view.dart';"
  binding_import_line="import '../features/$feature_name/bindings/${feature_name}_binding.dart';"
  
  # Add import statements for view and binding at the top of app_pages.dart if they don't exist
  if ! grep -q "$import_line" "$pages_file"; then
    sed -i "2i $import_line" "$pages_file"
  fi
  if ! grep -q "$binding_import_line" "$pages_file"; then
    sed -i "2i $binding_import_line" "$pages_file"
  fi

  # Add the new GetPage route
  sed -i "/static final routes = \[/a\ \ \ \ GetPage(\n\ \ \ \ \ \ name: _Paths.${feature_name^^},\n\ \ \ \ \ \ page: () => ${pascal_case_feature_name}View(),\n\ \ \ \ \ \ binding: ${pascal_case_feature_name}Binding(),\n\ \ \ \ )," "$pages_file"
else
  echo "GetPage already exists in app_pages.dart"
fi

# Confirmation message
if [[ "$2" == "--widgets" ]]; then
  echo "Feature '$feature_name' created successfully with controllers, views, bindings, and widgets."
  echo "Route added to app_routes.dart and app_pages.dart."
else
  echo "Feature '$feature_name' created successfully with controllers, views, and bindings."
  echo "Route added to app_routes.dart and app_pages.dart."
fi
