﻿Assets {
  Id: 1475918536846487279
  Name: "Custom Grass from Grass Tall"
  PlatformAssetType: 13
  SerializationVersion: 65
  CustomMaterialAsset {
    BaseMaterialId: 11035654631309357891
    ParameterOverrides {
      Overrides {
        Name: "wind_intensity"
        Float: 0.1
      }
    }
    Assets {
      Id: 11035654631309357891
      Name: "Grass (default)"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "mi_grass_dynamic_001_uv"
      }
    }
  }
}
