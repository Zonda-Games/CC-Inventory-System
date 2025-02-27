﻿Assets {
  Id: 5151373499733762021
  Name: "ITEM_Consumable_ExamplePotion"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 1558197855077483019
      Objects {
        Id: 1558197855077483019
        Name: "ITEM_Consumable_ExamplePotion"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 4755894725365256958
        UnregisteredParameters {
          Overrides {
            Name: "cs:Name"
            String: "Example Consumable"
          }
          Overrides {
            Name: "cs:Icon"
            AssetReference {
              Id: 12827538106333085954
            }
          }
          Overrides {
            Name: "cs:LevelRequirement"
            Int: 4
          }
          Overrides {
            Name: "cs:MaxStackableSize"
            Int: 2
          }
          Overrides {
            Name: "cs:ItemType"
            String: "Consumable"
          }
          Overrides {
            Name: "cs:Description"
            String: "A harmless potion! Click to use!"
          }
          Overrides {
            Name: "cs:Rarity"
            String: "Uncommon"
          }
          Overrides {
            Name: "cs:ConsumptionEffect"
            AssetReference {
              Id: 15665912626586225084
            }
          }
          Overrides {
            Name: "cs:Name:tooltip"
            String: "The name of the Item that will be displayed in the inventory, loot view, and referenced in the drops table."
          }
          Overrides {
            Name: "cs:Icon:tooltip"
            String: "The Icon that will be displayed"
          }
          Overrides {
            Name: "cs:MaxStackableSize:tooltip"
            String: "The amount of items that can stack into this object in the inventory."
          }
          Overrides {
            Name: "cs:ItemType:tooltip"
            String: "The type of Item this is. This will reference a type from ItemSystems_Item -> Item.TYPES."
          }
          Overrides {
            Name: "cs:Description:tooltip"
            String: "The lore for this item when viewed from the Inventory"
          }
          Overrides {
            Name: "cs:Rarity:tooltip"
            String: "The theme of this item. This does not affect stats in anyways, but gives it a nice look in the inventory and loot view."
          }
          Overrides {
            Name: "cs:ConsumptionEffect:tooltip"
            String: "Only for the Consumable Item type. Read the Consumable Items section of the readme for details on how to implement this."
          }
          Overrides {
            Name: "cs:LevelRequirement:tooltip"
            String: "The level required to use this consumable"
          }
        }
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        Folder {
          IsGroup: true
        }
      }
      Objects {
        Id: 4755894725365256958
        Name: "ClientContext"
        Transform {
          Location {
          }
          Rotation {
            Pitch: 10.0505953
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 1558197855077483019
        ChildIds: 16516006589110556212
        WantsNetworking: true
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        NetworkContext {
        }
      }
      Objects {
        Id: 16516006589110556212
        Name: "Bottle 06"
        Transform {
          Location {
            X: 6.6573233e-07
          }
          Rotation {
            Pitch: -8.13918781
            Yaw: 36.2024
            Roll: -5.91641521
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4755894725365256958
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CoreMesh {
          MeshAsset {
            Id: 16409216176786813860
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          EnableCameraCollision: true
          StaticMesh {
            Physics {
            }
          }
        }
      }
    }
    Assets {
      Id: 12827538106333085954
      Name: "Fantasy Spell Potion 006"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "UI_Fantasy_Potion_006"
      }
    }
    Assets {
      Id: 16409216176786813860
      Name: "Bottle 06"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_prop_fantasy_bottle_006"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 65
}
