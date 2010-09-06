Oriented GEOMID_1_194867440 { 
    Geometry Cylinder { 
        Radius 0.511381
        Solid False
    }
}

Material APPID_6_201601160 { 
    Ambient <31,1,119>
    Diffuse 0.431929
    Specular 63
    Emission 25
}

Shape SHAPEID_1_201348104 { 
    Id  1
    ParentId  1454
    Geometry  GEOMID_1_194867440
    Appearance  APPID_6_201601160
}

Translated GEOMID_2_199972988 { 
    Translation <0,0,1>
    Geometry Oriented { 
        Geometry Cylinder { 
            Radius 0.511381
            Height 0.5
            Solid False
        }
    }
}

Material Color_3 { 
    Ambient <60,0,0>
    Diffuse 3
}

Shape SHAPEID_2_200925712 { 
    Id  2
    ParentId  1
    Geometry  GEOMID_2_199972988
    Appearance  Color_3
}

Translated GEOMID_3_193429564 { 
    Translation <0,0,1.5>
    Geometry Oriented { 
        Secondary <-0,0.999863,0.0165799>
        Geometry Cylinder { 
            Radius 0.511381
            Height 0.3
            Solid False
        }
    }
}

Texture2D APPID_3_195328248 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
}

Shape SHAPEID_3_201258584 { 
    Id  3
    ParentId  2
    Geometry  GEOMID_3_193429564
    Appearance  APPID_3_195328248
}

Translated GEOMID_9_192886948 { 
    Translation <0.344107,0.370501,1.846>
    Geometry Oriented { 
        Primary <-0.55892,0.424912,0.71208>
        Secondary <-0.672897,-0.734237,-0.0900308>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Material Default { 
    Ambient <3,5,2>
    Diffuse 32
}

Shape SHAPEID_9_196760160 { 
    Id  9
    ParentId  3
    Geometry  GEOMID_9_192886948
    Appearance  Default
}

Translated GEOMID_11_201218436 { 
    Translation <0,-0.00497396,1.79996>
    Geometry Oriented { 
        Primary <-0.737277,0.675506,0.0106412>
        Secondary <-0.67559,-0.737186,-0.0116128>
        Geometry Cylinder { 
            Radius 0.511381
            Height 0.5
            Solid False
        }
    }
}

Shape SHAPEID_11_192532816 { 
    Id  11
    ParentId  3
    Geometry  GEOMID_11_201218436
    Appearance  Color_3
}

Translated GEOMID_12_171079964 { 
    Translation <0,-0.0128494,2.2999>
    Geometry Oriented { 
        Primary <-0.737283,0.675508,0.0101091>
        Secondary <-0.675491,-0.737348,0.00554725>
        Geometry Cylinder { 
            Radius 0.511381
            Height 0.21082
            Solid False
        }
    }
}

Texture2D APPID_12_194053696 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_12_196537464 { 
    Id  12
    ParentId  11
    Geometry  GEOMID_12_171079964
    Appearance  APPID_12_194053696
}

Translated GEOMID_14_192082108 { 
    Translation <-0.505056,-0.0578779,2.55611>
    Geometry Oriented { 
        Primary <0.0866687,-0.99623,-0.00365668>
        Secondary <0.16199,0.0104707,0.986737>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.10541
            Solid False
        }
    }
}

Texture2D APPID_14_201159376 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_14_199613968 { 
    Id  14
    ParentId  12
    Geometry  GEOMID_14_192082108
    Appearance  APPID_14_201159376
}

Translated GEOMID_14_195296748 { 
    Translation <-0.608672,-0.0669549,2.57322>
    Geometry Oriented { 
        Primary <0.0866687,-0.99623,-0.00365668>
        Secondary <0.16199,0.0104707,0.986737>
        Geometry Scaled { 
            Scale <0.52705,0.52705,0.52705>
            Geometry Scaled leaf { 
                Geometry BezierPatch { 
                    UDegree 3
                    VDegree 3
                    CtrlPointMatrix [
                         [ <-0.01,-0.01,1,1>, <0,-0.02,0.99,1>, <0,-0.01,1,1>, <0,-0.01,1,1> ],
                         [ <-0.43,0.13,0.76,1>, <-0.16,0.34,0.27,1>, <0.21,0.34,0.27,1>, <0.43,0.12,0.76,1> ],
                         [ <-0.75,0,0.19,1>, <-0.25,0,0.19,1>, <0.25,0,0.19,1>, <0.75,0,0.19,1> ],
                         [ <-0.01,0,-0.01,1>, <-0.01,0,-0.01,1>, <0,0,-0.01,1>, <-0.01,0,-0.01,1> ]
                    ]
                    UStride 10
                    VStride 10
                }
            }
        }
    }
}

Texture2D APPID_14_195983320 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_14_182373912 { 
    Id  14
    ParentId  14
    Geometry  GEOMID_14_195296748
    Appearance  APPID_14_195983320
}

Translated GEOMID_18_193594836 { 
    Translation <-0.505056,-0.0578779,2.55611>
    Geometry Oriented { 
        Primary <0.124253,-0.701555,0.701699>
        Secondary <0.99225,0.0869237,-0.0887964>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_18_196082232 { 
    Id  18
    ParentId  12
    Geometry  GEOMID_18_193594836
    Appearance  Default
}

Translated GEOMID_20_201249652 { 
    Translation <0.00236143,-0.0134268,2.5107>
    Geometry Oriented { 
        Primary <0.0872295,-0.996182,-0.00352031>
        Secondary <0.996131,0.0872617,-0.0103736>
        Geometry Cylinder { 
            Radius 0.511381
            Height 0.5
            Solid False
        }
    }
}

Shape SHAPEID_20_192748152 { 
    Id  20
    ParentId  12
    Geometry  GEOMID_20_201249652
    Appearance  Color_3
}

Translated GEOMID_21_194653924 { 
    Translation <0.007682,-0.0147277,3.01067>
    Geometry Oriented { 
        Primary <0.0872284,-0.996183,-0.0033443>
        Secondary <0.996168,0.0872045,0.00672543>
        Geometry Cylinder { 
            Radius 0.511381
            Height 0.264208
            Solid False
        }
    }
}

Texture2D APPID_21_196375368 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_21_194185440 { 
    Id  21
    ParentId  20
    Geometry  GEOMID_21_194653924
    Appearance  APPID_21_196375368
}

Translated GEOMID_23_172297356 { 
    Translation <0.410377,-0.326027,3.3163>
    Geometry Oriented { 
        Primary <0.607843,0.794027,0.00692466>
        Secondary <-0.127208,0.0887648,0.987896>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.132104
            Solid False
        }
    }
}

Texture2D APPID_23_169065136 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_23_196099176 { 
    Id  23
    ParentId  21
    Geometry  GEOMID_23_172297356
    Appearance  APPID_23_169065136
}

Translated GEOMID_23_200807516 { 
    Translation <0.513921,-0.40547,3.33677>
    Geometry Oriented { 
        Primary <0.607843,0.794027,0.00692466>
        Secondary <-0.127208,0.0887648,0.987896>
        Geometry Scaled { 
            Scale <0.660519,0.660519,0.660519>
            Geometry leaf

        }
    }
}

Texture2D APPID_23_209499728 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_23_193793672 { 
    Id  23
    ParentId  23
    Geometry  GEOMID_23_200807516
    Appearance  APPID_23_209499728
}

Translated GEOMID_27_200188772 { 
    Translation <0.410377,-0.326027,3.3163>
    Geometry Oriented { 
        Primary <0.381635,0.592177,0.709705>
        Secondary <-0.790777,0.606719,-0.0810151>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_27_199877336 { 
    Id  27
    ParentId  21
    Geometry  GEOMID_27_200188772
    Appearance  Default
}

Translated GEOMID_29_206336620 { 
    Translation <0.00598892,-0.0157629,3.27487>
    Geometry Oriented { 
        Primary <0.608687,0.793382,0.00665887>
        Secondary <-0.793379,0.608567,0.0140156>
        Geometry Cylinder { 
            Radius 0.522609
            Height 0.160824
            Solid False
        }
    }
}

Texture2D APPID_29_171259240 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_29_192434576 { 
    Id  29
    ParentId  21
    Geometry  GEOMID_29_206336620
    Appearance  APPID_29_171259240
}

Translated GEOMID_31_172172052 { 
    Translation <-0.0832814,0.49447,3.48402>
    Geometry Oriented { 
        Primary <-0.984651,-0.174479,0.00449678>
        Secondary <0.0332905,-0.162455,0.986154>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.0804121
            Solid False
        }
    }
}

Texture2D APPID_31_196247424 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_31_200396984 { 
    Id  31
    ParentId  29
    Geometry  GEOMID_31_172172052
    Appearance  APPID_31_196247424
}

Translated GEOMID_31_206335356 { 
    Translation <-0.0970586,0.572564,3.49735>
    Geometry Oriented { 
        Primary <-0.984651,-0.174479,0.00449678>
        Secondary <0.0332905,-0.162455,0.986154>
        Geometry Scaled { 
            Scale <0.40206,0.40206,0.40206>
            Geometry leaf

        }
    }
}

Texture2D APPID_31_199564664 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_31_201222856 { 
    Id  31
    ParentId  31
    Geometry  GEOMID_31_206335356
    Appearance  APPID_31_199564664
}

Translated GEOMID_35_197317836 { 
    Translation <-0.0832814,0.49447,3.48402>
    Geometry Oriented { 
        Primary <-0.681756,-0.186993,0.707278>
        Secondary <0.172991,-0.98057,-0.0924984>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_35_193467736 { 
    Id  35
    ParentId  29
    Geometry  GEOMID_35_197317836
    Appearance  Default
}

Translated GEOMID_37_208397828 { 
    Translation <0.00712553,-0.0179846,3.43568>
    Geometry Oriented { 
        Primary <-0.984771,-0.173802,0.0043314>
        Secondary <0.173814,-0.984775,0.00248949>
        Geometry Cylinder { 
            Radius 0.530236
            Height 0.198295
            Solid False
        }
    }
}

Texture2D APPID_37_195378304 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <9.59444,0>
    }
}

Shape SHAPEID_37_199702752 { 
    Id  37
    ParentId  29
    Geometry  GEOMID_37_208397828
    Appearance  APPID_37_195378304
}

Translated GEOMID_39_171981140 { 
    Translation <-0.275954,-0.463051,3.67796>
    Geometry Oriented { 
        Primary <0.843353,-0.537358,-0.00149289>
        Secondary <0.0855016,0.131446,0.987629>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.0991473
            Solid False
        }
    }
}

Texture2D APPID_39_196028832 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <9.59444,0>
    }
}

Shape SHAPEID_39_172419848 { 
    Id  39
    ParentId  37
    Geometry  GEOMID_39_171981140
    Appearance  APPID_39_196028832
}

Translated GEOMID_39_209635228 { 
    Translation <-0.328553,-0.545646,3.69351>
    Geometry Oriented { 
        Primary <0.843353,-0.537358,-0.00149289>
        Secondary <0.0855016,0.131446,0.987629>
        Geometry Scaled { 
            Scale <0.495736,0.495736,0.495736>
            Geometry leaf

        }
    }
}

Texture2D APPID_39_194042016 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <9.59444,0>
    }
}

Shape SHAPEID_39_193929232 { 
    Id  39
    ParentId  39
    Geometry  GEOMID_39_209635228
    Appearance  APPID_39_194042016
}

Translated GEOMID_43_201540748 { 
    Translation <-0.275954,-0.463051,3.67796>
    Geometry Oriented { 
        Primary <0.628798,-0.330993,0.703603>
        Secondary <0.535307,0.840573,-0.082968>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_43_193403848 { 
    Id  43
    ParentId  37
    Geometry  GEOMID_43_201540748
    Appearance  Default
}

Translated GEOMID_45_193566132 { 
    Translation <0.00788554,-0.0173491,3.63397>
    Geometry Oriented { 
        Primary <0.843476,-0.537165,-0.00143599>
        Secondary <0.537141,0.843406,0.0120567>
        Geometry Cylinder { 
            Radius 0.530236
            Height 0.247154
            Solid False
        }
    }
}

Texture2D APPID_45_164959752 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <11.9931,0>
    }
}

Shape SHAPEID_45_194547448 { 
    Id  45
    ParentId  37
    Geometry  GEOMID_45_193566132
    Appearance  APPID_45_164959752
}

Translated GEOMID_47_193656820 { 
    Translation <0.516842,0.116732,3.92668>
    Geometry Oriented { 
        Primary <-0.260337,0.965475,0.00908639>
        Secondary <-0.151781,-0.0502174,0.987138>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.123577
            Solid False
        }
    }
}

Texture2D APPID_47_194494984 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <11.9931,0>
    }
}

Shape SHAPEID_47_196710472 { 
    Id  47
    ParentId  45
    Geometry  GEOMID_47_193656820
    Appearance  APPID_47_194494984
}

Translated GEOMID_47_172021324 { 
    Translation <0.634674,0.148319,3.94641>
    Geometry Oriented { 
        Primary <-0.260337,0.965475,0.00908639>
        Secondary <-0.151781,-0.0502174,0.987138>
        Geometry Scaled { 
            Scale <0.617886,0.617886,0.617886>
            Geometry leaf

        }
    }
}

Texture2D APPID_47_206343440 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <11.9931,0>
    }
}

Shape SHAPEID_47_199846832 { 
    Id  47
    ParentId  47
    Geometry  GEOMID_47_172021324
    Appearance  APPID_47_206343440
}

Translated GEOMID_51_169984684 { 
    Translation <0.516842,0.116732,3.92668>
    Geometry Oriented { 
        Primary <-0.240643,0.660794,0.710944>
        Secondary <-0.962322,-0.25797,-0.0859567>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_51_208506432 { 
    Id  51
    ParentId  45
    Geometry  GEOMID_51_169984684
    Appearance  Default
}

Translated GEOMID_53_196169548 { 
    Translation <0.0065842,-0.0200532,3.88111>
    Geometry Oriented { 
        Primary <-0.258993,0.96584,0.00874392>
        Secondary <-0.965816,-0.259069,0.0090567>
        Geometry Cylinder { 
            Radius 0.530236
            Height 0.306156
            Solid False
        }
    }
}

Texture2D APPID_53_195166288 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <14.3917,0>
    }
}

Shape SHAPEID_53_183378768 { 
    Id  53
    ParentId  45
    Geometry  GEOMID_53_196169548
    Appearance  APPID_53_195166288
}

Translated GEOMID_55_208549340 { 
    Translation <-0.458501,0.221805,4.23516>
    Geometry Oriented { 
        Primary <-0.46159,-0.887093,-0.000323673>
        Secondary <0.145131,-0.0758777,0.986499>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.153078
            Solid False
        }
    }
}

Texture2D APPID_55_193950920 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <14.3917,0>
    }
}

Shape SHAPEID_55_171874880 { 
    Id  55
    ParentId  53
    Geometry  GEOMID_55_208549340
    Appearance  APPID_55_193950920
}

Translated GEOMID_55_208539588 { 
    Translation <-0.592466,0.291503,4.26023>
    Geometry Oriented { 
        Primary <-0.46159,-0.887093,-0.000323673>
        Secondary <0.145131,-0.0758777,0.986499>
        Geometry Scaled { 
            Scale <0.76539,0.76539,0.76539>
            Geometry leaf

        }
    }
}

Texture2D APPID_55_194032080 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <14.3917,0>
    }
}

Shape SHAPEID_55_193952248 { 
    Id  55
    ParentId  55
    Geometry  GEOMID_55_208539588
    Appearance  APPID_55_194032080
}

Translated GEOMID_59_195618700 { 
    Translation <-0.458501,0.221805,4.23516>
    Geometry Oriented { 
        Primary <-0.269796,-0.656977,0.703982>
        Secondary <0.883488,-0.459654,-0.090372>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_59_201529608 { 
    Id  59
    ParentId  53
    Geometry  GEOMID_59_195618700
    Appearance  Default
}

Translated GEOMID_61_193456532 { 
    Translation <0.00995578,-0.0219206,4.18724>
    Geometry Oriented { 
        Primary <-0.461546,-0.887116,-0.000311674>
        Secondary <0.887055,-0.46151,-0.0119554>
        Geometry Frustum { 
            Radius 0.530236
            Height 0.5
            Taper 1.00614
            Solid False
        }
    }
}

Shape SHAPEID_61_208945104 { 
    Id  61
    ParentId  53
    Geometry  GEOMID_61_193456532
    Appearance  Color_3
}

Translated GEOMID_62_193524628 { 
    Translation <0.0151868,-0.0248178,4.6872>
    Geometry Oriented { 
        Primary <-0.461546,-0.887116,-0.000296091>
        Secondary <0.887103,-0.461541,0.00522269>
        Geometry Cylinder { 
            Radius 0.533489
            Height 0.535746
            Solid False
        }
    }
}

Texture2D APPID_62_193754760 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <16.7903,0>
    }
}

Shape SHAPEID_62_208761384 { 
    Id  62
    ParentId  61
    Geometry  GEOMID_62_193524628
    Appearance  APPID_62_193754760
}

Translated GEOMID_64_195998732 { 
    Translation <0.194592,-0.523258,5.26664>
    Geometry Oriented { 
        Primary <0.939411,0.342774,0.00370097>
        Secondary <-0.0568425,0.145118,0.98778>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.267873
            Solid False
        }
    }
}

Texture2D APPID_64_193349200 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <16.7903,0>
    }
}

Shape SHAPEID_64_194171592 { 
    Id  64
    ParentId  62
    Geometry  GEOMID_64_195998732
    Appearance  APPID_64_193349200
}

Translated GEOMID_64_193394716 { 
    Translation <0.285146,-0.771882,5.30838>
    Geometry Oriented { 
        Primary <0.939411,0.342774,0.00370097>
        Secondary <-0.0568425,0.145118,0.98778>
        Geometry Scaled { 
            Scale <1.33937,1.33937,1.33937>
            Geometry leaf

        }
    }
}

Texture2D APPID_64_201788232 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <16.7903,0>
    }
}

Shape SHAPEID_64_193744000 { 
    Id  64
    ParentId  64
    Geometry  GEOMID_64_193394716
    Appearance  APPID_64_201788232
}

Translated GEOMID_68_199759604 { 
    Translation <0.194592,-0.523258,5.26664>
    Geometry Oriented { 
        Primary <0.642019,0.295712,0.707366>
        Secondary <-0.341077,0.936459,-0.0819159>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_68_193529888 { 
    Id  68
    ParentId  62
    Geometry  GEOMID_68_199759604
    Appearance  Default
}

Translated GEOMID_70_201749716 { 
    Translation <0.0126314,-0.0236671,5.22294>
    Geometry Oriented { 
        Primary <0.939606,0.342241,0.00355938>
        Secondary <-0.342257,0.939515,0.0131121>
        Geometry Cylinder { 
            Radius 0.531866
            Height 0.33048
            Solid False
        }
    }
}

Texture2D APPID_70_200284840 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <19.1889,0>
    }
}

Shape SHAPEID_70_208105680 { 
    Id  70
    ParentId  62
    Geometry  GEOMID_70_201749716
    Appearance  APPID_70_200284840
}

Translated GEOMID_72_199051564 { 
    Translation <0.215613,0.461295,5.6012>
    Geometry Oriented { 
        Primary <-0.924336,0.38153,0.00615092>
        Secondary <-0.0567018,-0.153277,0.986555>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.16524
            Solid False
        }
    }
}

Texture2D APPID_72_201082152 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <19.1889,0>
    }
}

Shape SHAPEID_72_196064680 { 
    Id  72
    ParentId  70
    Geometry  GEOMID_72_199051564
    Appearance  APPID_72_201082152
}

Translated GEOMID_72_193454300 { 
    Translation <0.277965,0.611921,5.62818>
    Geometry Oriented { 
        Primary <-0.924336,0.38153,0.00615092>
        Secondary <-0.0567018,-0.153277,0.986555>
        Geometry Scaled { 
            Scale <0.826199,0.826199,0.826199>
            Geometry leaf

        }
    }
}

Texture2D APPID_72_208437464 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <19.1889,0>
    }
}

Shape SHAPEID_72_197345496 { 
    Id  72
    ParentId  72
    Geometry  GEOMID_72_193454300
    Appearance  APPID_72_208437464
}

Translated GEOMID_76_192894060 { 
    Translation <0.215613,0.461295,5.6012>
    Geometry Oriented { 
        Primary <-0.673717,0.209669,0.708621>
        Secondary <-0.38093,-0.920224,-0.089887>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_76_191617088 { 
    Id  76
    ParentId  70
    Geometry  GEOMID_76_192894060
    Appearance  Default
}

Translated GEOMID_78_194764796 { 
    Translation <0.0130093,-0.0281413,5.55339>
    Geometry Oriented { 
        Primary <-0.923978,0.3824,0.00592247>
        Secondary <-0.382374,-0.923994,0.00511166>
        Geometry Cylinder { 
            Radius 0.531866
            Height 0.245708
            Solid False
        }
    }
}

Texture2D APPID_78_207250960 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <21.5875,0>
    }
}

Shape SHAPEID_78_193403472 { 
    Id  78
    ParentId  70
    Geometry  GEOMID_78_194764796
    Appearance  APPID_78_207250960
}

Translated GEOMID_80_195603116 { 
    Translation <-0.465351,-0.251637,5.84473>
    Geometry Oriented { 
        Primary <0.422774,-0.906234,-0.00090146>
        Secondary <0.144904,0.0666181,0.987201>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.122854
            Solid False
        }
    }
}

Texture2D APPID_80_200114888 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <21.5875,0>
    }
}

Shape SHAPEID_80_201403456 { 
    Id  80
    ParentId  78
    Geometry  GEOMID_80_195603116
    Appearance  APPID_80_200114888
}

Translated GEOMID_80_194574676 { 
    Translation <-0.575253,-0.302928,5.86433>
    Geometry Oriented { 
        Primary <0.422774,-0.906234,-0.00090146>
        Secondary <0.144904,0.0666181,0.987201>
        Geometry Scaled { 
            Scale <0.61427,0.61427,0.61427>
            Geometry leaf

        }
    }
}

Texture2D APPID_80_200136984 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <21.5875,0>
    }
}

Shape SHAPEID_80_196678176 { 
    Id  80
    ParentId  80
    Geometry  GEOMID_80_194574676
    Appearance  APPID_80_200136984
}

Translated GEOMID_84_193055628 { 
    Translation <-0.465351,-0.251637,5.84473>
    Geometry Oriented { 
        Primary <0.35425,-0.615707,0.703855>
        Secondary <0.90283,0.421347,-0.0858156>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_84_199903632 { 
    Id  84
    ParentId  78
    Geometry  GEOMID_84_193055628
    Appearance  Default
}

Translated GEOMID_86_209819876 { 
    Translation <0.0148341,-0.0275372,5.79909>
    Geometry Oriented { 
        Primary <0.4229,-0.906176,-0.000867465>
        Secondary <0.906141,0.422875,0.00919904>
        Geometry Cylinder { 
            Radius 0.531866
            Height 0.648021
            Solid False
        }
    }
}

Texture2D APPID_86_177312832 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <23.9861,0>
    }
}

Shape SHAPEID_86_192997416 { 
    Id  86
    ParentId  78
    Geometry  GEOMID_86_209819876
    Appearance  APPID_86_177312832
}

Translated GEOMID_88_206338652 { 
    Translation <0.515159,-0.189789,6.49193>
    Geometry Oriented { 
        Primary <0.299393,0.954106,0.00676829>
        Secondary <-0.152832,0.0409533,0.987403>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.32401
            Solid False
        }
    }
}

Texture2D APPID_88_193960832 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <23.9861,0>
    }
}

Shape SHAPEID_88_196283632 { 
    Id  88
    ParentId  86
    Geometry  GEOMID_88_206338652
    Appearance  APPID_88_193960832
}

Translated GEOMID_88_169208756 { 
    Translation <0.820315,-0.285909,6.54315>
    Geometry Oriented { 
        Primary <0.299393,0.954106,0.00676829>
        Secondary <-0.152832,0.0409533,0.987403>
        Geometry Scaled { 
            Scale <1.62005,1.62005,1.62005>
            Geometry leaf

        }
    }
}

Texture2D APPID_88_195330440 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <23.9861,0>
    }
}

Shape SHAPEID_88_199128704 { 
    Id  88
    ParentId  88
    Geometry  GEOMID_88_169208756
    Appearance  APPID_88_195330440
}

Translated GEOMID_92_203269524 { 
    Translation <0.515159,-0.189789,6.49193>
    Geometry Oriented { 
        Primary <0.153716,0.687838,0.709401>
        Secondary <-0.950406,0.299364,-0.084326>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_92_192715400 { 
    Id  92
    ParentId  86
    Geometry  GEOMID_92_203269524
    Appearance  Default
}

Translated GEOMID_94_200256804 { 
    Translation <0.00966997,-0.0305676,6.44708>
    Geometry Oriented { 
        Primary <0.300383,0.953796,0.00651164>
        Secondary <-0.953783,0.300306,0.0106936>
        Geometry Cylinder { 
            Radius 0.535105
            Height 0.403689
            Solid False
        }
    }
}

Texture2D APPID_94_194124120 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <26.3847,0>
    }
}

Shape SHAPEID_94_201681344 { 
    Id  94
    ParentId  86
    Geometry  GEOMID_94_200256804
    Appearance  APPID_94_194124120
}

Translated GEOMID_96_194954340 { 
    Translation <-0.253629,0.427065,6.89895>
    Geometry Oriented { 
        Primary <-0.865649,-0.500646,0.00239118>
        Secondary <0.0838988,-0.140354,0.98654>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.201845
            Solid False
        }
    }
}

Texture2D APPID_96_193932600 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <26.3847,0>
    }
}

Shape SHAPEID_96_194651976 { 
    Id  96
    ParentId  94
    Geometry  GEOMID_96_194954340
    Appearance  APPID_96_193932600
}

Translated GEOMID_96_192474156 { 
    Translation <-0.353254,0.59948,6.93195>
    Geometry Oriented { 
        Primary <-0.865649,-0.500646,0.00239118>
        Secondary <0.0838988,-0.140354,0.98654>
        Geometry Scaled { 
            Scale <1.00922,1.00922,1.00922>
            Geometry leaf

        }
    }
}

Texture2D APPID_96_196668712 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <26.3847,0>
    }
}

Shape SHAPEID_96_200449096 { 
    Id  96
    ParentId  96
    Geometry  GEOMID_96_192474156
    Appearance  APPID_96_196668712
}

Translated GEOMID_100_201670212 { 
    Translation <-0.253629,0.427065,6.89895>
    Geometry Oriented { 
        Primary <-0.578815,-0.408199,0.705936>
        Secondary <0.49827,-0.862329,-0.090087>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_100_192835728 { 
    Id  100
    ParentId  94
    Geometry  GEOMID_100_201670212
    Appearance  Default
}

Translated GEOMID_102_192512164 { 
    Translation <0.012998,-0.0343715,6.85074>
    Geometry Oriented { 
        Primary <-0.865832,-0.500329,0.00230244>
        Secondary <0.500335,-0.865818,0.00491107>
        Geometry Cylinder { 
            Radius 0.533489
            Height 0.512816
            Solid False
        }
    }
}

Texture2D APPID_102_165391072 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <28.7833,0>
    }
}

Shape SHAPEID_102_193418104 { 
    Id  102
    ParentId  94
    Geometry  GEOMID_102_192512164
    Appearance  APPID_102_165391072
}

Translated GEOMID_104_199973228 { 
    Translation <-0.102107,-0.550675,7.40802>
    Geometry Oriented { 
        Primary <0.976433,-0.215816,0.00160022>
        Secondary <0.0323768,0.153807,0.98757>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.256408
            Solid False
        }
    }
}

Texture2D APPID_104_209513536 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <28.7833,0>
    }
}

Shape SHAPEID_104_193556128 { 
    Id  104
    ParentId  102
    Geometry  GEOMID_104_199973228
    Appearance  APPID_104_209513536
}

Translated GEOMID_104_207084740 { 
    Translation <-0.156819,-0.797915,7.44832>
    Geometry Oriented { 
        Primary <0.976433,-0.215816,0.00160022>
        Secondary <0.0323768,0.153807,0.98757>
        Geometry Scaled { 
            Scale <1.28204,1.28204,1.28204>
            Geometry leaf

        }
    }
}

Texture2D APPID_104_208958864 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <28.7833,0>
    }
}

Shape SHAPEID_104_201761440 { 
    Id  104
    ParentId  104
    Geometry  GEOMID_104_207084740
    Appearance  APPID_104_208958864
}

Translated GEOMID_108_165611764 { 
    Translation <-0.102107,-0.550675,7.40802>
    Geometry Oriented { 
        Primary <0.702041,-0.0948878,0.705787>
        Secondary <0.215313,0.972981,-0.0833605>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_108_192962744 { 
    Id  108
    ParentId  102
    Geometry  GEOMID_108_165611764
    Appearance  Default
}

Translated GEOMID_110_200954876 { 
    Translation <0.0127602,-0.0316002,7.36355>
    Geometry Oriented { 
        Primary <0.97638,-0.216056,0.00153932>
        Secondary <0.216024,0.976318,0.0116628>
        Geometry Cylinder { 
            Radius 0.533489
            Height 0.979685
            Solid False
        }
    }
}

Texture2D APPID_110_196370888 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <31.1819,0>
    }
}

Shape SHAPEID_110_193911416 { 
    Id  110
    ParentId  102
    Geometry  GEOMID_110_200954876
    Appearance  APPID_110_196370888
}

Translated GEOMID_112_194745564 { 
    Translation <0.444036,0.262551,8.38989>
    Geometry Oriented { 
        Primary <-0.574756,0.818298,0.00665654>
        Secondary <-0.128095,-0.0979997,0.986908>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.489843
            Solid False
        }
    }
}

Texture2D APPID_112_200115936 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <31.1819,0>
    }
}

Shape SHAPEID_112_199080664 { 
    Id  112
    ParentId  110
    Geometry  GEOMID_112_194745564
    Appearance  APPID_112_200115936
}

Translated GEOMID_112_194516932 { 
    Translation <0.839945,0.539988,8.46883>
    Geometry Oriented { 
        Primary <-0.574756,0.818298,0.00665654>
        Secondary <-0.128095,-0.0979997,0.986908>
        Geometry Scaled { 
            Scale <2.44921,2.44921,2.44921>
            Geometry leaf

        }
    }
}

Texture2D APPID_112_183073128 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <31.1819,0>
    }
}

Shape SHAPEID_112_200904640 { 
    Id  112
    ParentId  112
    Geometry  GEOMID_112_194516932
    Appearance  APPID_112_183073128
}

Translated GEOMID_116_196529348 { 
    Translation <0.444036,0.262551,8.38989>
    Geometry Oriented { 
        Primary <-0.454107,0.539379,0.709124>
        Secondary <-0.815793,-0.571674,-0.0875843>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_116_195301472 { 
    Id  116
    ParentId  110
    Geometry  GEOMID_116_196529348
    Appearance  Default
}

Translated GEOMID_118_172156324 { 
    Translation <0.00881927,-0.0424304,8.34317>
    Geometry Oriented { 
        Primary <-0.573922,0.818885,0.00640717>
        Secondary <-0.818852,-0.573957,0.0074233>
        Geometry Cylinder { 
            Radius 0.533489
            Height 0.528412
            Solid False
        }
    }
}

Texture2D APPID_118_192769176 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <33.5806,0>
    }
}

Shape SHAPEID_118_199830776 { 
    Id  118
    ParentId  110
    Geometry  GEOMID_118_172156324
    Appearance  APPID_118_192769176
}

Translated GEOMID_120_201122660 { 
    Translation <-0.512942,0.0261724,8.91836>
    Geometry Oriented { 
        Primary <-0.130024,-0.991511,0.00028745>
        Secondary <0.159959,-0.0206905,0.986907>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.264206
            Solid False
        }
    }
}

Texture2D APPID_120_195534392 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <33.5806,0>
    }
}

Shape SHAPEID_120_200288336 { 
    Id  120
    ParentId  118
    Geometry  GEOMID_120_201122660
    Appearance  APPID_120_195534392
}

Translated GEOMID_120_201461300 { 
    Translation <-0.771474,0.0600879,8.96098>
    Geometry Oriented { 
        Primary <-0.130024,-0.991511,0.00028745>
        Secondary <0.159959,-0.0206905,0.986907>
        Geometry Scaled { 
            Scale <1.32103,1.32103,1.32103>
            Geometry leaf

        }
    }
}

Texture2D APPID_120_201254288 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <33.5806,0>
    }
}

Shape SHAPEID_120_200951080 { 
    Id  120
    ParentId  120
    Geometry  GEOMID_120_201461300
    Appearance  APPID_120_201254288
}

Translated GEOMID_124_193445804 { 
    Translation <-0.512942,0.0261724,8.91836>
    Geometry Oriented { 
        Primary <-0.0304158,-0.708967,0.704585>
        Secondary <0.987681,-0.129569,-0.0877386>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_124_195190432 { 
    Id  124
    ParentId  118
    Geometry  GEOMID_124_193445804
    Appearance  Default
}

Translated GEOMID_126_200288444 { 
    Translation <0.0139746,-0.0429515,8.87155>
    Geometry Oriented { 
        Primary <-0.130068,-0.991505,0.000276688>
        Secondary <0.991479,-0.130063,0.00726884>
        Geometry Cylinder { 
            Radius 0.533489
            Height 0.591166
            Solid False
        }
    }
}

Texture2D APPID_126_165614688 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <35.9792,0>
    }
}

Shape SHAPEID_126_193882856 { 
    Id  126
    ParentId  118
    Geometry  GEOMID_126_200288444
    Appearance  APPID_126_165614688
}

Translated GEOMID_128_202428428 { 
    Translation <0.351635,-0.449318,9.50736>
    Geometry Oriented { 
        Primary <0.76527,0.643693,0.00464809>
        Secondary <-0.104896,0.117578,0.987508>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.295583
            Solid False
        }
    }
}

Texture2D APPID_128_193916032 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <35.9792,0>
    }
}

Shape SHAPEID_128_206360856 { 
    Id  128
    ParentId  126
    Geometry  GEOMID_128_202428428
    Appearance  APPID_128_193916032
}

Translated GEOMID_128_199996708 { 
    Translation <0.539362,-0.672838,9.55392>
    Geometry Oriented { 
        Primary <0.76527,0.643693,0.00464809>
        Secondary <-0.104896,0.117578,0.987508>
        Geometry Scaled { 
            Scale <1.47792,1.47792,1.47792>
            Geometry leaf

        }
    }
}

Texture2D APPID_128_208343672 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <35.9792,0>
    }
}

Shape SHAPEID_128_193457472 { 
    Id  128
    ParentId  128
    Geometry  GEOMID_128_199996708
    Appearance  APPID_128_208343672
}

Translated GEOMID_132_196026204 { 
    Translation <0.351635,-0.449318,9.50736>
    Geometry Oriented { 
        Primary <0.500669,0.498157,0.707934>
        Secondary <-0.640875,0.763067,-0.0837105>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_132_194904160 { 
    Id  132
    ParentId  126
    Geometry  GEOMID_132_196026204
    Appearance  Default
}

Translated GEOMID_134_199017068 { 
    Translation <0.00973528,-0.0422304,9.4627>
    Geometry Oriented { 
        Primary <0.765729,0.643148,0.00447144>
        Secondary <-0.643152,0.765655,0.0113114>
        Geometry Cylinder { 
            Radius 0.531866
            Height 0.828273
            Solid False
        }
    }
}

Texture2D APPID_134_208438128 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <38.3778,0>
    }
}

Shape SHAPEID_134_192466696 { 
    Id  134
    ParentId  126
    Geometry  GEOMID_134_199017068
    Appearance  APPID_134_208438128
}

Translated GEOMID_136_167261572 { 
    Translation <0.0357786,0.477466,10.3384>
    Geometry Oriented { 
        Primary <-0.99909,0.0424336,0.00428758>
        Secondary <-0.00267656,-0.162714,0.98667>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.414137
            Solid False
        }
    }
}

Texture2D APPID_136_199544952 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <38.3778,0>
    }
}

Shape SHAPEID_136_194672520 { 
    Id  136
    ParentId  134
    Geometry  GEOMID_136_167261572
    Appearance  APPID_136_199544952
}

Translated GEOMID_136_199158980 { 
    Translation <0.0534066,0.885705,10.4057>
    Geometry Oriented { 
        Primary <-0.99909,0.0424336,0.00428758>
        Secondary <-0.00267656,-0.162714,0.98667>
        Geometry Scaled { 
            Scale <2.07068,2.07068,2.07068>
            Geometry leaf

        }
    }
}

Texture2D APPID_136_209064680 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <38.3778,0>
    }
}

Shape SHAPEID_136_199772424 { 
    Id  136
    ParentId  136
    Geometry  GEOMID_136_199158980
    Appearance  APPID_136_209064680
}

Translated GEOMID_140_195561884 { 
    Translation <0.0357786,0.477466,10.3384>
    Geometry Oriented { 
        Primary <-0.706105,-0.0329262,0.707341>
        Secondary <-0.0429683,-0.995085,-0.0892138>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_140_194916512 { 
    Id  140
    ParentId  134
    Geometry  GEOMID_140_195561884
    Appearance  Default
}

Translated GEOMID_142_195106452 { 
    Translation <0.0129252,-0.0517864,10.2909>
    Geometry Oriented { 
        Primary <-0.999063,0.0430893,0.00412793>
        Secondary <-0.0430651,-0.999056,0.00578773>
        Geometry Cylinder { 
            Radius 0.533489
            Height 0.988712
            Solid False
        }
    }
}

Texture2D APPID_142_193903408 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <40.7764,0>
    }
}

Shape SHAPEID_142_191672120 { 
    Id  142
    ParentId  134
    Geometry  GEOMID_142_195106452
    Appearance  APPID_142_193903408
}

Translated GEOMID_144_192790996 { 
    Translation <-0.358412,-0.422312,11.325>
    Geometry Oriented { 
        Primary <0.707585,-0.706628,0.000855725>
        Secondary <0.111647,0.112993,0.987303>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.494356
            Solid False
        }
    }
}

Texture2D APPID_144_209831216 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <40.7764,0>
    }
}

Shape SHAPEID_144_193462504 { 
    Id  144
    ParentId  142
    Geometry  GEOMID_144_192790996
    Appearance  APPID_144_209831216
}

Translated GEOMID_144_193990740 { 
    Translation <-0.70335,-0.767622,11.4036>
    Geometry Oriented { 
        Primary <0.707585,-0.706628,0.000855725>
        Secondary <0.111647,0.112993,0.987303>
        Geometry Scaled { 
            Scale <2.47178,2.47178,2.47178>
            Geometry leaf

        }
    }
}

Texture2D APPID_144_208546832 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <40.7764,0>
    }
}

Shape SHAPEID_144_195959664 { 
    Id  144
    ParentId  144
    Geometry  GEOMID_144_193990740
    Appearance  APPID_144_208546832
}

Translated GEOMID_148_201217812 { 
    Translation <-0.358412,-0.422312,11.325>
    Geometry Oriented { 
        Primary <0.54242,-0.456667,0.70515>
        Secondary <0.704159,0.704919,-0.0851398>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_148_172364296 { 
    Id  148
    ParentId  142
    Geometry  GEOMID_148_201217812
    Appearance  Default
}

Translated GEOMID_150_195992612 { 
    Translation <0.0172493,-0.0462451,11.2796>
    Geometry Oriented { 
        Primary <0.707492,-0.706721,0.000823374>
        Secondary <0.706681,0.707464,0.00987725>
        Geometry Cylinder { 
            Radius 0.533489
            Height 1.22539
            Solid False
        }
    }
}

Texture2D APPID_150_199758216 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <43.175,0>
    }
}

Shape SHAPEID_150_193757488 { 
    Id  150
    ParentId  142
    Geometry  GEOMID_150_195992612
    Appearance  APPID_150_199758216
}

Translated GEOMID_152_195415372 { 
    Translation <0.538982,-0.0306314,12.5507>
    Geometry Oriented { 
        Primary <-0.0451109,0.998964,0.00598841>
        Secondary <-0.159116,-0.013103,0.987173>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.612693
            Solid False
        }
    }
}

Texture2D APPID_152_198996040 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <43.175,0>
    }
}

Shape SHAPEID_152_196184704 { 
    Id  152
    ParentId  150
    Geometry  GEOMID_152_195415372
    Appearance  APPID_152_198996040
}

Translated GEOMID_152_200785636 { 
    Translation <1.14324,-0.00393067,12.6485>
    Geometry Oriented { 
        Primary <-0.0451109,0.998964,0.00598841>
        Secondary <-0.159116,-0.013103,0.987173>
        Geometry Scaled { 
            Scale <3.06346,3.06346,3.06346>
            Geometry leaf

        }
    }
}

Texture2D APPID_152_173123888 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <43.175,0>
    }
}

Shape SHAPEID_152_200380072 { 
    Id  152
    ParentId  152
    Geometry  GEOMID_152_200785636
    Appearance  APPID_152_173123888
}

Translated GEOMID_156_192636620 { 
    Translation <0.538982,-0.0306314,12.5507>
    Geometry Oriented { 
        Primary <-0.0920596,0.699422,0.708755>
        Secondary <-0.995334,-0.0439817,-0.0858806>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_156_169725528 { 
    Id  156
    ParentId  150
    Geometry  GEOMID_156_192636620
    Appearance  Default
}

Translated GEOMID_158_195227404 { 
    Translation <0.00798174,-0.0540952,12.5049>
    Geometry Oriented { 
        Primary <-0.0441944,0.999006,0.00576264>
        Secondary <-0.998979,-0.0442459,0.00913352>
        Geometry Cylinder { 
            Radius 0.533489
            Height 1.32388
            Solid False
        }
    }
}

Texture2D APPID_158_194884576 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <45.5736,0>
    }
}

Shape SHAPEID_158_208289432 { 
    Id  158
    ParentId  150
    Geometry  GEOMID_158_195227404
    Appearance  APPID_158_194884576
}

Translated GEOMID_160_192602860 { 
    Translation <-0.386875,0.280151,13.876>
    Geometry Oriented { 
        Primary <-0.642094,-0.766624,0.00189657>
        Secondary <0.125415,-0.102602,0.986785>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.661941
            Solid False
        }
    }
}

Texture2D APPID_160_202222120 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <45.5736,0>
    }
}

Shape SHAPEID_160_200978024 { 
    Id  160
    ParentId  158
    Geometry  GEOMID_160_192602860
    Appearance  APPID_160_202222120
}

Translated GEOMID_160_201090012 { 
    Translation <-0.8875,0.69972,13.9832>
    Geometry Oriented { 
        Primary <-0.642094,-0.766624,0.00189657>
        Secondary <0.125415,-0.102602,0.986785>
        Geometry Scaled { 
            Scale <3.30971,3.30971,3.30971>
            Geometry leaf

        }
    }
}

Texture2D APPID_160_191727032 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <45.5736,0>
    }
}

Shape SHAPEID_160_194047888 { 
    Id  160
    ParentId  160
    Geometry  GEOMID_160_201090012
    Appearance  APPID_160_191727032
}

Translated GEOMID_164_193827556 { 
    Translation <0.020399,-0.0611821,13.8287>
    Geometry Oriented { 
        Primary <-0.465334,-0.566502,0.680103>
        Secondary <0.766649,-0.641986,-0.0102023>
        Geometry Cylinder { 
            Radius 0.30771
            Solid False
        }
    }
}

Shape SHAPEID_164_208917200 { 
    Id  164
    ParentId  158
    Geometry  GEOMID_164_193827556
    Appearance  APPID_6_201601160
}

Translated GEOMID_165_194082220 { 
    Translation <0.462795,0.45547,14.5618>
    Geometry Oriented { 
        Primary <-0.481541,-0.585429,0.652221>
        Secondary <0.766892,-0.641702,-0.009784>
        Geometry Cylinder { 
            Radius 0.30771
            Height 0.5
            Solid False
        }
    }
}

Shape SHAPEID_165_209068264 { 
    Id  165
    ParentId  164
    Geometry  GEOMID_165_194082220
    Appearance  Color_3
}

Translated GEOMID_166_192552284 { 
    Translation <0.674925,0.703206,14.9408>
    Geometry Oriented { 
        Primary <-0.495831,-0.603051,0.624886>
        Secondary <0.774104,-0.63305,0.0033014>
        Geometry Cylinder { 
            Radius 0.30771
            Height 0.221302
            Solid False
        }
    }
}

Shape SHAPEID_166_199544016 { 
    Id  166
    ParentId  165
    Geometry  GEOMID_166_192552284
    Appearance  APPID_3_195328248
}

Translated GEOMID_168_193525948 { 
    Translation <0.832529,0.549203,15.2597>
    Geometry Oriented { 
        Primary <0.901354,-0.0305732,-0.432004>
        Secondary <0.371777,0.566257,0.735619>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.110651
            Solid False
        }
    }
}

Texture2D APPID_5_196508344 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
}

Shape SHAPEID_168_192842592 { 
    Id  168
    ParentId  166
    Geometry  GEOMID_168_193525948
    Appearance  APPID_5_196508344
}

Translated GEOMID_168_194116916 { 
    Translation <0.857109,0.458064,15.3175>
    Geometry Oriented { 
        Primary <0.901354,-0.0305732,-0.432004>
        Secondary <0.371777,0.566257,0.735619>
        Geometry Scaled { 
            Scale <0.553256,0.553256,0.553256>
            Geometry leaf

        }
    }
}

Shape SHAPEID_168_169174368 { 
    Id  168
    ParentId  168
    Geometry  GEOMID_168_194116916
    Appearance  APPID_5_196508344
}

Translated GEOMID_172_201305380 { 
    Translation <0.832529,0.549203,15.2597>
    Geometry Oriented { 
        Primary <0.903294,0.367459,0.221437>
        Secondary <-0.229117,0.849551,-0.47515>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_172_194584720 { 
    Id  172
    ParentId  166
    Geometry  GEOMID_172_201305380
    Appearance  Default
}

Translated GEOMID_174_192598836 { 
    Translation <0.762028,0.810618,15.1135>
    Geometry Oriented { 
        Primary <0.89808,0.028696,-0.438894>
        Secondary <-0.226917,0.885042,-0.406459>
        Geometry Frustum { 
            Radius 0.30771
            Height 0.5
            Taper 0.987946
            Solid False
        }
    }
}

Shape SHAPEID_174_208104984 { 
    Id  174
    ParentId  166
    Geometry  GEOMID_174_192598836
    Appearance  Color_3
}

Translated GEOMID_175_194991228 { 
    Translation <0.950416,1.04293,15.5142>
    Geometry Oriented { 
        Primary <0.906818,0.0390044,-0.419713>
        Secondary <-0.212494,0.902233,-0.375262>
        Geometry Cylinder { 
            Radius 0.304
            Height 0.211123
            Solid False
        }
    }
}

Texture2D APPID_175_165448240 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_175_208567416 { 
    Id  175
    ParentId  174
    Geometry  GEOMID_175_194991228
    Appearance  APPID_175_165448240
}

Translated GEOMID_177_171866052 { 
    Translation <1.17521,1.35797,15.5466>
    Geometry Oriented { 
        Primary <-0.819049,0.570298,0.0626061>
        Secondary <0.261872,0.274525,0.925235>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.105562
            Solid False
        }
    }
}

Texture2D APPID_177_197350248 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_177_193753928 { 
    Id  177
    ParentId  175
    Geometry  GEOMID_177_171866052
    Appearance  APPID_177_197350248
}

Translated GEOMID_177_200478212 { 
    Translation <1.22909,1.4397,15.5071>
    Geometry Oriented { 
        Primary <-0.819049,0.570298,0.0626061>
        Secondary <0.261872,0.274525,0.925235>
        Geometry Scaled { 
            Scale <0.527808,0.527808,0.527808>
            Geometry leaf

        }
    }
}

Texture2D APPID_177_193065016 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_177_172399768 { 
    Id  177
    ParentId  177
    Geometry  GEOMID_177_200478212
    Appearance  APPID_177_193065016
}

Translated GEOMID_181_191667116 { 
    Translation <1.17521,1.35797,15.5466>
    Geometry Oriented { 
        Primary <-0.355324,0.656013,0.665877>
        Secondary <-0.486625,-0.738039,0.467435>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_181_209545928 { 
    Id  181
    ParentId  175
    Geometry  GEOMID_181_191667116
    Appearance  Default
}

Translated GEOMID_183_193992276 { 
    Translation <1.02727,1.1336,15.6887>
    Geometry Oriented { 
        Primary <-0.81322,0.579496,0.0534618>
        Secondary <-0.460689,-0.69717,0.54929>
        Geometry Cylinder { 
            Radius 0.304
            Height 0.434192
            Solid False
        }
    }
}

Texture2D APPID_183_196724840 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_183_193384920 { 
    Id  183
    ParentId  175
    Geometry  GEOMID_183_193992276
    Appearance  APPID_183_196724840
}

Translated GEOMID_185_192966148 { 
    Translation <0.919205,1.2807,16.1998>
    Geometry Oriented { 
        Primary <0.322998,-0.893474,0.312053>
        Secondary <0.442741,0.434074,0.784577>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.217096
            Solid False
        }
    }
}

Texture2D APPID_185_196546624 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_185_199130992 { 
    Id  185
    ParentId  183
    Geometry  GEOMID_185_192966148
    Appearance  APPID_185_196546624
}

Translated GEOMID_185_193862228 { 
    Translation <0.737615,1.25567,16.3162>
    Geometry Oriented { 
        Primary <0.322998,-0.893474,0.312053>
        Secondary <0.442741,0.434074,0.784577>
        Geometry Scaled { 
            Scale <1.08548,1.08548,1.08548>
            Geometry leaf

        }
    }
}

Texture2D APPID_185_191627544 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_185_193009984 { 
    Id  185
    ParentId  185
    Geometry  GEOMID_185_193862228
    Appearance  APPID_185_191627544
}

Translated GEOMID_189_200398516 { 
    Translation <0.919205,1.2807,16.1998>
    Geometry Oriented { 
        Primary <0.500148,-0.330537,0.800373>
        Secondary <0.863354,0.118964,-0.490375>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_189_196270216 { 
    Id  189
    ParentId  183
    Geometry  GEOMID_189_200398516
    Appearance  Default
}

Translated GEOMID_191_193826580 { 
    Translation <1.18166,1.31686,16.0508>
    Geometry Oriented { 
        Primary <0.282508,-0.905442,0.316803>
        Secondary <0.902617,0.139101,-0.407349>
        Geometry Cylinder { 
            Radius 0.300223
            Height 0.611261
            Solid False
        }
    }
}

Texture2D APPID_191_194807312 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_191_192774328 { 
    Id  191
    ParentId  183
    Geometry  GEOMID_191_193826580
    Appearance  APPID_191_194807312
}

Translated GEOMID_193_201483860 { 
    Translation <1.63823,1.40857,16.5733>
    Geometry Oriented { 
        Primary <0.472359,0.719414,-0.509236>
        Secondary <0.205487,0.471949,0.857344>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.305631
            Solid False
        }
    }
}

Texture2D APPID_193_192447248 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_193_194597416 { 
    Id  193
    ParentId  191
    Geometry  GEOMID_193_201483860
    Appearance  APPID_193_192447248
}

Translated GEOMID_193_193715820 { 
    Translation <1.9002,1.25281,16.5962>
    Geometry Oriented { 
        Primary <0.472359,0.719414,-0.509236>
        Secondary <0.205487,0.471949,0.857344>
        Geometry Scaled { 
            Scale <1.52815,1.52815,1.52815>
            Geometry leaf

        }
    }
}

Texture2D APPID_193_196004848 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_193_193669448 { 
    Id  193
    ParentId  193
    Geometry  GEOMID_193_193715820
    Appearance  APPID_193_196004848
}

Translated GEOMID_197_195351140 { 
    Translation <1.63823,1.40857,16.5733>
    Geometry Oriented { 
        Primary <0.495996,0.832499,0.246845>
        Secondary <-0.85954,0.511055,0.00354732>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_197_194844080 { 
    Id  197
    ParentId  191
    Geometry  GEOMID_197_195351140
    Appearance  Default
}

Translated GEOMID_199_192633620 { 
    Translation <1.38018,1.562,16.5744>
    Geometry Oriented { 
        Primary <0.410391,0.771786,-0.485721>
        Secondary <-0.852307,0.514034,0.0966492>
        Geometry Cylinder { 
            Radius 0.296372
            Height 0.740959
            Solid False
        }
    }
}

Texture2D APPID_199_194808112 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <9.59444,0>
    }
}

Shape SHAPEID_199_192446648 { 
    Id  199
    ParentId  191
    Geometry  GEOMID_199_192633620
    Appearance  APPID_199_194808112
}

Translated GEOMID_201_195407940 { 
    Translation <1.51429,2.11157,17.1684>
    Geometry Oriented { 
        Primary <-0.850422,-0.293443,0.436662>
        Secondary <0.38164,0.227206,0.895951>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.37048
            Solid False
        }
    }
}

Texture2D APPID_201_165357072 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <9.59444,0>
    }
}

Shape SHAPEID_201_195602648 { 
    Id  201
    ParentId  199
    Geometry  GEOMID_201_195407940
    Appearance  APPID_201_165357072
}

Translated GEOMID_201_196219468 { 
    Translation <1.38013,2.45559,17.1383>
    Geometry Oriented { 
        Primary <-0.850422,-0.293443,0.436662>
        Secondary <0.38164,0.227206,0.895951>
        Geometry Scaled { 
            Scale <1.8524,1.8524,1.8524>
            Geometry leaf

        }
    }
}

Texture2D APPID_201_193689112 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <9.59444,0>
    }
}

Shape SHAPEID_201_193559416 { 
    Id  201
    ParentId  201
    Geometry  GEOMID_201_196219468
    Appearance  APPID_201_193689112
}

Translated GEOMID_205_193999612 { 
    Translation <1.51429,2.11157,17.1684>
    Geometry Oriented { 
        Primary <-0.361105,0.0291335,0.93207>
        Secondary <0.358192,-0.918504,0.167481>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_205_195135552 { 
    Id  205
    ParentId  199
    Geometry  GEOMID_205_193999612
    Appearance  Default
}

Translated GEOMID_207_194664892 { 
    Translation <1.62045,1.83935,17.2181>
    Geometry Oriented { 
        Primary <-0.885279,-0.230199,0.404091>
        Secondary <0.352306,-0.899158,0.259605>
        Geometry Cylinder { 
            Radius 0.292446
            Height 0.571207
            Solid False
        }
    }
}

Texture2D APPID_207_199826608 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <11.9931,0>
    }
}

Shape SHAPEID_207_193003144 { 
    Id  207
    ParentId  199
    Geometry  GEOMID_207_194664892
    Appearance  APPID_207_199826608
}

Translated GEOMID_209_207025932 { 
    Translation <1.69788,1.81977,17.8688>
    Geometry Oriented { 
        Primary <0.885893,-0.449397,-0.115049>
        Secondary <0.338068,0.45561,0.823486>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.285603
            Solid False
        }
    }
}

Texture2D APPID_209_192672496 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <11.9931,0>
    }
}

Shape SHAPEID_209_194991016 { 
    Id  209
    ParentId  207
    Geometry  GEOMID_209_207025932
    Appearance  APPID_209_192672496
}

Translated GEOMID_209_193681772 { 
    Translation <1.60716,1.60031,18.0274>
    Geometry Oriented { 
        Primary <0.885893,-0.449397,-0.115049>
        Secondary <0.338068,0.45561,0.823486>
        Geometry Scaled { 
            Scale <1.42802,1.42802,1.42802>
            Geometry leaf

        }
    }
}

Texture2D APPID_209_208451736 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <11.9931,0>
    }
}

Shape SHAPEID_209_193825744 { 
    Id  209
    ParentId  209
    Geometry  GEOMID_209_193681772
    Appearance  APPID_209_208451736
}

Translated GEOMID_213_208240060 { 
    Translation <1.69788,1.81977,17.8688>
    Geometry Oriented { 
        Primary <0.855415,-0.0199305,0.517559>
        Secondary <0.328193,0.793906,-0.511861>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_213_183302528 { 
    Id  213
    ParentId  207
    Geometry  GEOMID_213_208240060
    Appearance  Default
}

Translated GEOMID_215_194646708 { 
    Translation <1.79386,2.05195,17.7191>
    Geometry Oriented { 
        Primary <0.892564,-0.435514,-0.116865>
        Secondary <0.350375,0.832983,-0.428224>
        Geometry Cylinder { 
            Radius 0.292446
            Height 1.06561
            Solid False
        }
    }
}

Texture2D APPID_215_194681216 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <14.3917,0>
    }
}

Shape SHAPEID_215_201808680 { 
    Id  215
    ParentId  207
    Geometry  GEOMID_215_194646708
    Appearance  APPID_215_194681216
}

Translated GEOMID_217_193621724 { 
    Translation <2.35766,2.51267,18.5856>
    Geometry Oriented { 
        Primary <-0.383371,0.897959,-0.216094>
        Secondary <0.116286,0.279037,0.953213>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.532803
            Solid False
        }
    }
}

Texture2D APPID_217_193063136 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <14.3917,0>
    }
}

Shape SHAPEID_217_193701424 { 
    Id  217
    ParentId  215
    Geometry  GEOMID_217_193621724
    Appearance  APPID_217_193063136
}

Translated GEOMID_217_194176716 { 
    Translation <2.84584,2.69399,18.473>
    Geometry Oriented { 
        Primary <-0.383371,0.897959,-0.216094>
        Secondary <0.116286,0.279037,0.953213>
        Geometry Scaled { 
            Scale <2.66402,2.66402,2.66402>
            Geometry leaf

        }
    }
}

Texture2D APPID_217_199230808 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <14.3917,0>
    }
}

Shape SHAPEID_217_195188264 { 
    Id  217
    ParentId  217
    Geometry  GEOMID_217_194176716
    Appearance  APPID_217_199230808
}

Translated GEOMID_221_201010172 { 
    Translation <2.35766,2.51267,18.5856>
    Geometry Oriented { 
        Primary <-0.143518,0.849102,0.508359>
        Secondary <-0.893632,-0.331908,0.302092>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_221_192073728 { 
    Id  221
    ParentId  215
    Geometry  GEOMID_221_201010172
    Appearance  Default
}

Translated GEOMID_223_209544420 { 
    Translation <2.09632,2.41561,18.674>
    Geometry Oriented { 
        Primary <-0.418277,0.887424,-0.193706>
        Secondary <-0.862465,-0.321124,0.391194>
        Geometry Cylinder { 
            Radius 0.28844
            Height 1.4329
            Solid False
        }
    }
}

Texture2D APPID_223_199661344 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <16.7903,0>
    }
}

Shape SHAPEID_223_192896832 { 
    Id  223
    ParentId  215
    Geometry  GEOMID_223_209544420
    Appearance  APPID_223_199661344
}

Translated GEOMID_225_195497156 { 
    Translation <2.24336,2.99266,20.0286>
    Geometry Oriented { 
        Primary <-0.222875,-0.891533,0.39433>
        Secondary <0.398571,0.285815,0.871465>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.716451
            Solid False
        }
    }
}

Texture2D APPID_225_201365496 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <16.7903,0>
    }
}

Shape SHAPEID_225_195534616 { 
    Id  225
    ParentId  223
    Geometry  GEOMID_225_195497156
    Appearance  APPID_225_201365496
}

Translated GEOMID_225_200021244 { 
    Translation <1.60597,3.24442,20.2375>
    Geometry Oriented { 
        Primary <-0.222875,-0.891533,0.39433>
        Secondary <0.398571,0.285815,0.871465>
        Geometry Scaled { 
            Scale <3.58226,3.58226,3.58226>
            Geometry leaf

        }
    }
}

Texture2D APPID_225_183071448 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <16.7903,0>
    }
}

Shape SHAPEID_225_172574624 { 
    Id  225
    ParentId  225
    Geometry  GEOMID_225_200021244
    Appearance  APPID_225_183071448
}

Translated GEOMID_229_208220324 { 
    Translation <2.24336,2.99266,20.0286>
    Geometry Oriented { 
        Primary <0.0678499,-0.406036,0.911335>
        Secondary <0.905829,-0.357789,-0.226849>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_229_195117104 { 
    Id  229
    ParentId  223
    Geometry  GEOMID_229_208220324
    Appearance  Default
}

Translated GEOMID_231_194755116 { 
    Translation <2.50463,2.88946,19.9631>
    Geometry Oriented { 
        Primary <-0.279813,-0.878152,0.388014>
        Secondary <0.925219,-0.354539,-0.135177>
        Geometry Cylinder { 
            Radius 0.284349
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_231_165599944 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <19.1889,0>
    }
}

Shape SHAPEID_231_195962480 { 
    Id  231
    ParentId  223
    Geometry  GEOMID_231_194755116
    Appearance  APPID_231_165599944
}

Translated GEOMID_233_192743076 { 
    Translation <3.02344,3.12679,21.3828>
    Geometry Oriented { 
        Primary <0.856879,0.363702,-0.365347>
        Secondary <0.194645,0.427987,0.882576>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_233_195645600 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <19.1889,0>
    }
}

Shape SHAPEID_233_195993016 { 
    Id  233
    ParentId  231
    Geometry  GEOMID_233_192743076
    Appearance  APPID_233_195645600
}

Translated GEOMID_233_208344236 { 
    Translation <3.37788,2.51247,21.6025>
    Geometry Oriented { 
        Primary <0.856879,0.363702,-0.365347>
        Secondary <0.194645,0.427987,0.882576>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_233_200122744 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <19.1889,0>
    }
}

Shape SHAPEID_233_192512768 { 
    Id  233
    ParentId  233
    Geometry  GEOMID_233_208344236
    Appearance  APPID_233_200122744
}

Translated GEOMID_237_192845988 { 
    Translation <3.02344,3.12679,21.3828>
    Geometry Oriented { 
        Primary <0.755878,0.538424,0.372489>
        Secondary <-0.486173,0.842652,-0.23146>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_237_192955392 { 
    Id  237
    ParentId  231
    Geometry  GEOMID_237_192845988
    Appearance  Default
}

Translated GEOMID_239_194873508 { 
    Translation <2.8852,3.3664,21.317>
    Geometry Oriented { 
        Primary <0.836392,0.413727,-0.359553>
        Secondary <-0.486605,0.862394,-0.13961>
        Geometry Cylinder { 
            Radius 0.280169
            Height 0.495
            Solid False
        }
    }
}

Texture2D APPID_239_201388472 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <21.5875,0>
    }
}

Shape SHAPEID_239_195335304 { 
    Id  239
    ParentId  231
    Geometry  GEOMID_239_194873508
    Appearance  APPID_239_201388472
}

Translated GEOMID_241_165754460 { 
    Translation <3.06967,3.77515,21.7025>
    Geometry Oriented { 
        Primary <-0.952643,0.24545,0.179513>
        Secondary <0.213176,0.118065,0.969854>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.2475
            Solid False
        }
    }
}

Texture2D APPID_241_198993984 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <21.5875,0>
    }
}

Shape SHAPEID_241_194512392 { 
    Id  241
    ParentId  239
    Geometry  GEOMID_241_165754460
    Appearance  APPID_241_198993984
}

Translated GEOMID_241_195598956 { 
    Translation <3.12334,4.01329,21.6617>
    Geometry Oriented { 
        Primary <-0.952643,0.24545,0.179513>
        Secondary <0.213176,0.118065,0.969854>
        Geometry Scaled { 
            Scale <1.2375,1.2375,1.2375>
            Geometry leaf

        }
    }
}

Texture2D APPID_241_191692488 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <21.5875,0>
    }
}

Shape SHAPEID_241_209112328 { 
    Id  241
    ParentId  241
    Geometry  GEOMID_241_195598956
    Appearance  APPID_241_191692488
}

Translated GEOMID_245_171993284 { 
    Translation <3.06967,3.77515,21.7025>
    Geometry Oriented { 
        Primary <-0.5067,0.328845,0.796942>
        Secondary <-0.212645,-0.943506,0.254122>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_245_201584880 { 
    Id  245
    ParentId  239
    Geometry  GEOMID_245_171993284
    Appearance  Default
}

Translated GEOMID_247_196426140 { 
    Translation <3.01009,3.51081,21.7737>
    Geometry Oriented { 
        Primary <-0.947594,0.274955,0.162685>
        Secondary <-0.206511,-0.915695,0.344755>
        Geometry Cylinder { 
            Radius 0.280169
            Height 0.51784
            Solid False
        }
    }
}

Texture2D APPID_247_193392248 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <23.9861,0>
    }
}

Shape SHAPEID_247_201587496 { 
    Id  247
    ParentId  239
    Geometry  GEOMID_247_196426140
    Appearance  APPID_247_193392248
}

Translated GEOMID_249_202091596 { 
    Translation <2.9199,3.52893,22.3699>
    Geometry Oriented { 
        Primary <0.570069,-0.814592,0.107052>
        Secondary <0.333346,0.348413,0.876064>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.25892
            Solid False
        }
    }
}

Texture2D APPID_249_193080720 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <23.9861,0>
    }
}

Shape SHAPEID_249_195927688 { 
    Id  249
    ParentId  247
    Geometry  GEOMID_249_202091596
    Appearance  APPID_249_193080720
}

Translated GEOMID_249_196472204 { 
    Translation <2.72547,3.40886,22.4916>
    Geometry Oriented { 
        Primary <0.570069,-0.814592,0.107052>
        Secondary <0.333346,0.348413,0.876064>
        Geometry Scaled { 
            Scale <1.2946,1.2946,1.2946>
            Geometry leaf

        }
    }
}

Texture2D APPID_249_201052248 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <23.9861,0>
    }
}

Shape SHAPEID_249_195328176 { 
    Id  249
    ParentId  249
    Geometry  GEOMID_249_196472204
    Appearance  APPID_249_201052248
}

Translated GEOMID_253_192739556 { 
    Translation <2.9199,3.52893,22.3699>
    Geometry Oriented { 
        Primary <0.604657,-0.35073,0.715107>
        Secondary <0.772472,0.477033,-0.419197>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_253_173124072 { 
    Id  253
    ParentId  247
    Geometry  GEOMID_253_192739556
    Appearance  Default
}

Translated GEOMID_255_199785628 { 
    Translation <3.13632,3.66258,22.2524>
    Geometry Oriented { 
        Primary <0.557825,-0.822958,0.107568>
        Secondary <0.800571,0.49935,-0.331264>
        Geometry Cylinder { 
            Radius 0.275893
            Height 1.3499
            Solid False
        }
    }
}

Texture2D APPID_255_178525296 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <26.3847,0>
    }
}

Shape SHAPEID_255_201490600 { 
    Id  255
    ParentId  247
    Geometry  GEOMID_255_199785628
    Appearance  APPID_255_178525296
}

Translated GEOMID_257_209514220 { 
    Translation <3.70167,3.97587,23.4943>
    Geometry Oriented { 
        Primary <0.180662,0.934185,-0.307667>
        Secondary <0.0609467,0.30158,0.951491>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.67495
            Solid False
        }
    }
}

Texture2D APPID_257_203244128 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <26.3847,0>
    }
}

Shape SHAPEID_257_192883536 { 
    Id  257
    ParentId  255
    Geometry  GEOMID_257_209514220
    Appearance  APPID_257_203244128
}

Translated GEOMID_257_192987044 { 
    Translation <4.36424,3.84719,23.4926>
    Geometry Oriented { 
        Primary <0.180662,0.934185,-0.307667>
        Secondary <0.0609467,0.30158,0.951491>
        Geometry Scaled { 
            Scale <3.37475,3.37475,3.37475>
            Geometry leaf

        }
    }
}

Texture2D APPID_257_194567048 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <26.3847,0>
    }
}

Shape SHAPEID_257_193030288 { 
    Id  257
    ParentId  257
    Geometry  GEOMID_257_192987044
    Appearance  APPID_257_194567048
}

Translated GEOMID_261_194063308 { 
    Translation <3.70167,3.97587,23.4943>
    Geometry Oriented { 
        Primary <0.207801,0.86664,0.4536>
        Secondary <-0.978093,0.189957,0.0851508>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_261_196435760 { 
    Id  261
    ParentId  255
    Geometry  GEOMID_261_194063308
    Appearance  Default
}

Translated GEOMID_263_196668100 { 
    Translation <3.43182,4.02827,23.5178>
    Geometry Oriented { 
        Primary <0.133152,0.948152,-0.288579>
        Secondary <-0.965346,0.190013,0.17889>
        Geometry Cylinder { 
            Radius 0.271516
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_263_193999768 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <28.7833,0>
    }
}

Shape SHAPEID_263_194613144 { 
    Id  263
    ParentId  255
    Geometry  GEOMID_263_196668100
    Appearance  APPID_263_193999768
}

Translated GEOMID_265_208214644 { 
    Translation <3.596,4.61894,24.9196>
    Geometry Oriented { 
        Primary <-0.71721,-0.612286,0.332739>
        Secondary <0.317877,0.137457,0.938115>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_265_165707392 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <28.7833,0>
    }
}

Shape SHAPEID_265_200959752 { 
    Id  265
    ParentId  263
    Geometry  GEOMID_265_208214644
    Appearance  APPID_265_165707392
}

Translated GEOMID_265_192830620 { 
    Translation <3.13555,5.19705,24.9909>
    Geometry Oriented { 
        Primary <-0.71721,-0.612286,0.332739>
        Secondary <0.317877,0.137457,0.938115>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_265_206403440 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <28.7833,0>
    }
}

Shape SHAPEID_265_192480304 { 
    Id  265
    ParentId  265
    Geometry  GEOMID_265_192830620
    Appearance  APPID_265_206403440
}

Translated GEOMID_269_195117460 { 
    Translation <3.596,4.61894,24.9196>
    Geometry Oriented { 
        Primary <-0.325941,-0.281051,0.902648>
        Secondary <0.622905,-0.782077,-0.0185824>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_269_191654112 { 
    Id  269
    ParentId  263
    Geometry  GEOMID_269_195117460
    Appearance  Default
}

Translated GEOMID_271_172043980 { 
    Translation <3.76513,4.40659,24.9146>
    Geometry Oriented { 
        Primary <-0.753897,-0.575139,0.317575>
        Secondary <0.624749,-0.777152,0.0756539>
        Geometry Cylinder { 
            Radius 0.267032
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_271_165776328 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <31.1819,0>
    }
}

Shape SHAPEID_271_195236960 { 
    Id  271
    ParentId  263
    Geometry  GEOMID_271_172043980
    Appearance  APPID_271_165776328
}

Translated GEOMID_273_193930132 { 
    Translation <4.05427,4.53437,26.4069>
    Geometry Oriented { 
        Primary <0.976758,-0.123645,-0.175086>
        Secondary <0.209217,0.372387,0.904188>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_273_195920216 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <31.1819,0>
    }
}

Shape SHAPEID_273_183425112 { 
    Id  273
    ParentId  271
    Geometry  GEOMID_273_193930132
    Appearance  APPID_273_195920216
}

Translated GEOMID_273_165705692 { 
    Translation <4.01967,3.85142,26.6962>
    Geometry Oriented { 
        Primary <0.976758,-0.123645,-0.175086>
        Secondary <0.209217,0.372387,0.904188>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_273_189433048 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <31.1819,0>
    }
}

Shape SHAPEID_273_192877408 { 
    Id  273
    ParentId  273
    Geometry  GEOMID_273_165705692
    Appearance  APPID_273_189433048
}

Translated GEOMID_277_199863748 { 
    Translation <4.05427,4.53437,26.4069>
    Geometry Oriented { 
        Primary <0.836984,0.143771,0.528003>
        Secondary <0.0477236,0.942017,-0.332155>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_277_193756392 { 
    Id  277
    ParentId  271
    Geometry  GEOMID_277_199863748
    Appearance  Default
}

Translated GEOMID_279_193083892 { 
    Translation <4.06701,4.78592,26.3182>
    Geometry Oriented { 
        Primary <0.979744,-0.098832,-0.174167>
        Secondary <0.0548022,0.968852,-0.241501>
        Geometry Cylinder { 
            Radius 0.267032
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_279_193932304 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <33.5806,0>
    }
}

Shape SHAPEID_279_200088840 { 
    Id  279
    ParentId  271
    Geometry  GEOMID_279_193083892
    Appearance  APPID_279_193932304
}

Translated GEOMID_281_165623956 { 
    Translation <4.54518,5.30027,27.6811>
    Geometry Oriented { 
        Primary <-0.680554,0.731807,-0.0361216>
        Secondary <0.0616809,0.106346,0.992414>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_281_207155920 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <33.5806,0>
    }
}

Shape SHAPEID_281_194069384 { 
    Id  281
    ParentId  279
    Geometry  GEOMID_281_165623956
    Appearance  APPID_281_207155920
}

Translated GEOMID_281_199974468 { 
    Translation <5.08728,5.80009,27.5938>
    Geometry Oriented { 
        Primary <-0.680554,0.731807,-0.0361216>
        Secondary <0.0616809,0.106346,0.992414>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_281_196782120 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <33.5806,0>
    }
}

Shape SHAPEID_281_199650208 { 
    Id  281
    ParentId  281
    Geometry  GEOMID_281_199974468
    Appearance  APPID_281_196782120
}

Translated GEOMID_285_200970140 { 
    Translation <4.54518,5.30027,27.6811>
    Geometry Oriented { 
        Primary <-0.393718,0.633133,0.66643>
        Secondary <-0.719548,-0.663436,0.20519>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_285_200102400 { 
    Id  285
    ParentId  279
    Geometry  GEOMID_285_200970140
    Appearance  Default
}

Translated GEOMID_287_207212692 { 
    Translation <4.35304,5.12311,27.7359>
    Geometry Oriented { 
        Primary <-0.684966,0.727824,-0.0330647>
        Secondary <-0.702017,-0.647176,0.297214>
        Geometry Cylinder { 
            Radius 0.262432
            Height 0.683184
            Solid False
        }
    }
}

Texture2D APPID_287_200267952 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <35.9792,0>
    }
}

Shape SHAPEID_287_193881328 { 
    Id  287
    ParentId  279
    Geometry  GEOMID_287_207212692
    Appearance  APPID_287_200267952
}

Translated GEOMID_289_191631364 { 
    Translation <4.23308,5.28181,28.4569>
    Geometry Oriented { 
        Primary <0.0603739,-0.974274,0.217128>
        Secondary <0.320528,0.224928,0.920146>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.341592
            Solid False
        }
    }
}

Texture2D APPID_289_192886520 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <35.9792,0>
    }
}

Shape SHAPEID_289_201196968 { 
    Id  289
    ParentId  287
    Geometry  GEOMID_289_191631364
    Appearance  APPID_289_192886520
}

Translated GEOMID_289_194087068 { 
    Translation <3.91017,5.28661,28.5683>
    Geometry Oriented { 
        Primary <0.0603739,-0.974274,0.217128>
        Secondary <0.320528,0.224928,0.920146>
        Geometry Scaled { 
            Scale <1.70796,1.70796,1.70796>
            Geometry leaf

        }
    }
}

Texture2D APPID_289_200150224 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <35.9792,0>
    }
}

Shape SHAPEID_289_194102552 { 
    Id  289
    ParentId  289
    Geometry  GEOMID_289_194087068
    Appearance  APPID_289_200150224
}

Translated GEOMID_293_195071140 { 
    Translation <4.23308,5.28181,28.4569>
    Geometry Oriented { 
        Primary <0.216357,-0.529081,0.820526>
        Secondary <0.964534,-0.0143283,-0.263568>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_293_195004480 { 
    Id  293
    ParentId  287
    Geometry  GEOMID_293_195071140
    Appearance  Default
}

Translated GEOMID_295_192466204 { 
    Translation <4.48621,5.27805,28.3878>
    Geometry Oriented { 
        Primary <0.0285597,-0.976364,0.214237>
        Secondary <0.982238,-0.0123519,-0.187234>
        Geometry Frustum { 
            Radius 0.262432
            Height 0.5
            Taper 0.982003
            Solid False
        }
    }
}

Shape SHAPEID_295_193877424 { 
    Id  295
    ParentId  287
    Geometry  GEOMID_295_192466204
    Appearance  Color_3
}

Translated GEOMID_296_193084996 { 
    Translation <4.57893,5.38594,28.8671>
    Geometry Oriented { 
        Primary <0.0267783,-0.97865,0.203781>
        Secondary <0.986742,-0.00676498,-0.162154>
        Geometry Cylinder { 
            Radius 0.257709
            Height 0.384828
            Solid False
        }
    }
}

Texture2D APPID_296_200317088 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <38.3778,0>
    }
}

Shape SHAPEID_296_194909272 { 
    Id  296
    ParentId  295
    Geometry  GEOMID_296_193084996
    Appearance  APPID_296_200317088
}

Translated GEOMID_298_192730564 { 
    Translation <4.83183,5.29408,29.2633>
    Geometry Oriented { 
        Primary <0.676067,0.690899,-0.256111>
        Secondary <0.0516399,0.302299,0.951813>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.192414
            Solid False
        }
    }
}

Texture2D APPID_298_192752784 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <38.3778,0>
    }
}

Shape SHAPEID_298_193541096 { 
    Id  298
    ParentId  296
    Geometry  GEOMID_298_192730564
    Appearance  APPID_298_192752784
}

Translated GEOMID_298_193948004 { 
    Translation <4.97326,5.16772,29.2958>
    Geometry Oriented { 
        Primary <0.676067,0.690899,-0.256111>
        Secondary <0.0516399,0.302299,0.951813>
        Geometry Scaled { 
            Scale <0.96207,0.96207,0.96207>
            Geometry leaf

        }
    }
}

Texture2D APPID_298_201459000 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <38.3778,0>
    }
}

Shape SHAPEID_298_208829824 { 
    Id  298
    ParentId  298
    Geometry  GEOMID_298_193948004
    Appearance  APPID_298_201459000
}

Translated GEOMID_302_193469148 { 
    Translation <4.83183,5.29408,29.2633>
    Geometry Oriented { 
        Primary <0.541768,0.677993,0.496802>
        Secondary <-0.7423,0.663211,-0.0956085>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_302_208671408 { 
    Id  302
    ParentId  296
    Geometry  GEOMID_302_193469148
    Appearance  Default
}

Translated GEOMID_304_192952140 { 
    Translation <4.64053,5.46499,29.2387>
    Geometry Oriented { 
        Primary <0.649109,0.71945,-0.247081>
        Secondary <-0.742676,0.66965,-0.00120509>
        Geometry Cylinder { 
            Radius 0.252854
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_304_194512224 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <40.7764,0>
    }
}

Shape SHAPEID_304_209006704 { 
    Id  304
    ParentId  296
    Geometry  GEOMID_304_192952140
    Appearance  APPID_304_194512224
}

Translated GEOMID_306_200199292 { 
    Translation <4.85708,5.98912,30.657>
    Geometry Oriented { 
        Primary <-0.976884,-0.108887,0.183962>
        Secondary <0.18294,0.0193876,0.982933>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_306_165477576 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <40.7764,0>
    }
}

Shape SHAPEID_306_194570000 { 
    Id  306
    ParentId  304
    Geometry  GEOMID_306_200199292
    Appearance  APPID_306_165477576
}

Translated GEOMID_306_193489244 { 
    Translation <4.77496,6.72707,30.6577>
    Geometry Oriented { 
        Primary <-0.976884,-0.108887,0.183962>
        Secondary <0.18294,0.0193876,0.982933>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_306_194651760 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <40.7764,0>
    }
}

Shape SHAPEID_306_193722616 { 
    Id  306
    ParentId  306
    Geometry  GEOMID_306_193489244
    Appearance  APPID_306_194651760
}

Translated GEOMID_310_172318292 { 
    Translation <4.85708,5.98912,30.657>
    Geometry Oriented { 
        Primary <-0.568934,0.00439498,0.822371>
        Secondary <0.110227,-0.990555,0.0815509>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_310_192094184 { 
    Id  310
    ParentId  304
    Geometry  GEOMID_310_172318292
    Appearance  Default
}

Translated GEOMID_312_195558252 { 
    Translation <4.88495,5.73865,30.6776>
    Geometry Oriented { 
        Primary <-0.981773,-0.079827,0.172478>
        Secondary <0.1104,-0.978241,0.175661>
        Geometry Cylinder { 
            Radius 0.252854
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_312_196061024 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <43.175,0>
    }
}

Shape SHAPEID_312_201491512 { 
    Id  312
    ParentId  304
    Geometry  GEOMID_312_195558252
    Appearance  APPID_312_196061024
}

Translated GEOMID_314_193902244 { 
    Translation <4.97034,5.83075,32.1952>
    Geometry Oriented { 
        Primary <0.79778,-0.602894,-0.00814192>
        Secondary <0.22828,0.289519,0.929552>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_314_199676560 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <43.175,0>
    }
}

Shape SHAPEID_314_200182600 { 
    Id  314
    ParentId  312
    Geometry  GEOMID_314_193902244
    Appearance  APPID_314_199676560
}

Translated GEOMID_314_194045852 { 
    Translation <4.55598,5.27874,32.4689>
    Geometry Oriented { 
        Primary <0.79778,-0.602894,-0.00814192>
        Secondary <0.22828,0.289519,0.929552>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_314_196208824 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <43.175,0>
    }
}

Shape SHAPEID_314_191706552 { 
    Id  314
    ParentId  314
    Geometry  GEOMID_314_194045852
    Appearance  APPID_314_196208824
}

Translated GEOMID_318_171717820 { 
    Translation <4.97034,5.83075,32.1952>
    Geometry Oriented { 
        Primary <0.700679,-0.254701,0.666466>
        Secondary <0.570852,0.760473,-0.30953>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_318_206439520 { 
    Id  318
    ParentId  312
    Geometry  GEOMID_318_171717820
    Appearance  Default
}

Translated GEOMID_320_194633636 { 
    Translation <5.11469,6.02303,32.1169>
    Geometry Oriented { 
        Primary <0.798485,-0.601961,-0.00807197>
        Secondary <0.586121,0.780395,-0.217819>
        Geometry Cylinder { 
            Radius 0.247855
            Height 1.37476
            Solid False
        }
    }
}

Texture2D APPID_320_172214416 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <45.5736,0>
    }
}

Shape SHAPEID_320_191698896 { 
    Id  320
    ParentId  312
    Geometry  GEOMID_320_194633636
    Appearance  APPID_320_172214416
}

Translated GEOMID_322_193949644 { 
    Translation <5.54702,6.2979,33.4388>
    Geometry Oriented { 
        Primary <-0.168934,0.97517,-0.143192>
        Secondary <-0.0270289,0.140642,0.989691>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.687381
            Solid False
        }
    }
}

Texture2D APPID_322_201051984 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <45.5736,0>
    }
}

Shape SHAPEID_322_201684432 { 
    Id  322
    ParentId  320
    Geometry  GEOMID_322_193949644
    Appearance  APPID_322_201051984
}

Translated GEOMID_322_192970772 { 
    Translation <6.22427,6.41548,33.4406>
    Geometry Oriented { 
        Primary <-0.168934,0.97517,-0.143192>
        Secondary <-0.0270289,0.140642,0.989691>
        Geometry Scaled { 
            Scale <3.43691,3.43691,3.43691>
            Geometry leaf

        }
    }
}

Texture2D APPID_322_182505488 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <45.5736,0>
    }
}

Shape SHAPEID_322_209181280 { 
    Id  322
    ParentId  322
    Geometry  GEOMID_322_192970772
    Appearance  APPID_322_182505488
}

Translated GEOMID_326_192724652 { 
    Translation <5.54702,6.2979,33.4388>
    Geometry Oriented { 
        Primary <-0.0899414,0.797441,0.596656>
        Secondary <-0.982114,-0.170517,0.0798531>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_326_208372520 { 
    Id  326
    ParentId  320
    Geometry  GEOMID_326_192724652
    Appearance  Default
}

Translated GEOMID_328_192521196 { 
    Translation <5.3036,6.25564,33.4586>
    Geometry Oriented { 
        Primary <-0.191654,0.972236,-0.134264>
        Secondary <-0.970427,-0.167261,0.174055>
        Geometry Cylinder { 
            Radius 0.242702
            Height 0.740659
            Solid False
        }
    }
}

Texture2D APPID_328_171946592 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <47.9722,0>
    }
}

Shape SHAPEID_328_199095184 { 
    Id  328
    ParentId  320
    Geometry  GEOMID_328_192521196
    Appearance  APPID_328_171946592
}

Translated GEOMID_330_191729548 { 
    Translation <5.20843,6.50558,34.2088>
    Geometry Oriented { 
        Primary <-0.487113,-0.846979,0.21295>
        Secondary <0.269266,0.0863038,0.959191>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.370329
            Solid False
        }
    }
}

Texture2D APPID_330_194559552 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <47.9722,0>
    }
}

Shape SHAPEID_330_192606880 { 
    Id  330
    ParentId  328
    Geometry  GEOMID_330_191729548
    Appearance  APPID_330_194559552
}

Translated GEOMID_330_192847940 { 
    Translation <4.90076,6.69984,34.2777>
    Geometry Oriented { 
        Primary <-0.487113,-0.846979,0.21295>
        Secondary <0.269266,0.0863038,0.959191>
        Geometry Scaled { 
            Scale <1.85165,1.85165,1.85165>
            Geometry leaf

        }
    }
}

Texture2D APPID_330_209528168 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <47.9722,0>
    }
}

Shape SHAPEID_330_193075240 { 
    Id  330
    ParentId  330
    Geometry  GEOMID_330_192847940
    Appearance  APPID_330_209528168
}

Translated GEOMID_334_196059796 { 
    Translation <5.20843,6.50558,34.2088>
    Geometry Oriented { 
        Primary <-0.205385,-0.505459,0.83805>
        Secondary <0.840036,-0.53041,-0.114038>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_334_193003080 { 
    Id  334
    ParentId  328
    Geometry  GEOMID_334_196059796
    Appearance  Default
}

Translated GEOMID_336_193544516 { 
    Translation <5.41231,6.37685,34.1812>
    Geometry Oriented { 
        Primary <-0.515714,-0.831648,0.205912>
        Secondary <0.84752,-0.530403,-0.0195745>
        Geometry Cylinder { 
            Radius 0.23738
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_336_194973400 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <50.3708,0>
    }
}

Shape SHAPEID_336_193724832 { 
    Id  336
    ParentId  328
    Geometry  GEOMID_336_193544516
    Appearance  APPID_336_194973400
}

Translated GEOMID_338_172394380 { 
    Translation <5.66352,6.39745,35.6806>
    Geometry Oriented { 
        Primary <0.959204,0.232749,-0.160488>
        Secondary <0.0875362,0.295265,0.951397>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_338_208117752 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <50.3708,0>
    }
}

Shape SHAPEID_338_195165136 { 
    Id  338
    ParentId  336
    Geometry  GEOMID_338_172394380
    Appearance  APPID_338_208117752
}

Translated GEOMID_338_208117116 { 
    Translation <5.86312,5.70943,35.8757>
    Geometry Oriented { 
        Primary <0.959204,0.232749,-0.160488>
        Secondary <0.0875362,0.295265,0.951397>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_338_194905592 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <50.3708,0>
    }
}

Shape SHAPEID_338_193677768 { 
    Id  338
    ParentId  338
    Geometry  GEOMID_338_208117116
    Appearance  APPID_338_194905592
}

Translated GEOMID_342_172171780 { 
    Translation <5.66352,6.39745,35.6806>
    Geometry Oriented { 
        Primary <0.750949,0.33616,0.568393>
        Secondary <-0.273215,0.94177,-0.196018>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_342_194876376 { 
    Id  342
    ParentId  336
    Geometry  GEOMID_342_172171780
    Appearance  Default
}

Translated GEOMID_344_195942604 { 
    Translation <5.59867,6.62101,35.6341>
    Geometry Oriented { 
        Primary <0.953856,0.256018,-0.156887>
        Secondary <-0.273525,0.956412,-0.102273>
        Geometry Cylinder { 
            Radius 0.23738
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_344_194141504 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <52.7694,0>
    }
}

Shape SHAPEID_344_200396280 { 
    Id  344
    ParentId  336
    Geometry  GEOMID_344_195942604
    Appearance  APPID_344_194141504
}

Translated GEOMID_346_201489884 { 
    Translation <5.889,7.04061,37.0703>
    Geometry Oriented { 
        Primary <-0.891671,0.450201,0.0473576>
        Secondary <0.0474462,-0.0110949,0.998812>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_346_202260768 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <52.7694,0>
    }
}

Shape SHAPEID_346_195041272 { 
    Id  346
    ParentId  344
    Geometry  GEOMID_346_201489884
    Appearance  APPID_346_202260768
}

Translated GEOMID_346_200254364 { 
    Translation <6.22327,7.70356,37.0618>
    Geometry Oriented { 
        Primary <-0.891671,0.450201,0.0473576>
        Secondary <0.0474462,-0.0110949,0.998812>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_346_193783240 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <52.7694,0>
    }
}

Shape SHAPEID_346_195065176 { 
    Id  346
    ParentId  346
    Geometry  GEOMID_346_200254364
    Appearance  APPID_346_193783240
}

Translated GEOMID_350_208250252 { 
    Translation <5.889,7.04061,37.0703>
    Geometry Oriented { 
        Primary <-0.569267,0.365412,0.736484>
        Secondary <-0.448202,-0.888913,0.0946029>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_350_195223160 { 
    Id  350
    ParentId  344
    Geometry  GEOMID_350_208250252
    Appearance  Default
}

Translated GEOMID_352_208097692 { 
    Translation <5.78261,6.8296,37.0928>
    Geometry Oriented { 
        Primary <-0.888348,0.45703,0.0442767>
        Secondary <-0.441805,-0.877037,0.188715>
        Geometry Cylinder { 
            Radius 0.231874
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_352_208372048 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <55.1681,0>
    }
}

Shape SHAPEID_352_197309048 { 
    Id  352
    ParentId  344
    Geometry  GEOMID_352_208097692
    Appearance  APPID_352_208372048
}

Translated GEOMID_354_195282068 { 
    Translation <5.75677,6.9723,38.6047>
    Geometry Oriented { 
        Primary <0.36847,-0.925101,0.0917511>
        Secondary <0.249099,0.193337,0.948984>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_354_208953952 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <55.1681,0>
    }
}

Shape SHAPEID_354_208647528 { 
    Id  354
    ParentId  352
    Geometry  GEOMID_354_195282068
    Appearance  APPID_354_208953952
}

Translated GEOMID_354_200859732 { 
    Translation <5.09175,6.72964,38.8287>
    Geometry Oriented { 
        Primary <0.36847,-0.925101,0.0917511>
        Secondary <0.249099,0.193337,0.948984>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_354_200143016 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <55.1681,0>
    }
}

Shape SHAPEID_354_193034264 { 
    Id  354
    ParentId  354
    Geometry  GEOMID_354_200859732
    Appearance  APPID_354_200143016
}

Translated GEOMID_358_202094220 { 
    Translation <5.75677,6.9723,38.6047>
    Geometry Oriented { 
        Primary <0.390234,-0.534386,0.749766>
        Secondary <0.912507,0.33297,-0.237616>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_358_200444280 { 
    Id  358
    ParentId  352
    Geometry  GEOMID_358_202094220
    Appearance  Default
}

Translated GEOMID_360_193548828 { 
    Translation <5.96835,7.0495,38.5496>
    Geometry Oriented { 
        Primary <0.355973,-0.930137,0.0901549>
        Secondary <0.928746,0.341446,-0.144382>
        Geometry Cylinder { 
            Radius 0.226166
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_360_196522104 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <57.5667,0>
    }
}

Shape SHAPEID_360_200275536 { 
    Id  360
    ParentId  352
    Geometry  GEOMID_360_193548828
    Appearance  APPID_360_196522104
}

Translated GEOMID_362_200435076 { 
    Translation <6.33141,7.16495,40.0209>
    Geometry Oriented { 
        Primary <0.388927,0.906707,-0.163153>
        Secondary <-0.0402421,0.193648,0.980245>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_362_192449944 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <57.5667,0>
    }
}

Shape SHAPEID_362_192899176 { 
    Id  362
    ParentId  360
    Geometry  GEOMID_362_200435076
    Appearance  APPID_362_192449944
}

Translated GEOMID_362_195918700 { 
    Translation <7.0148,6.88675,40.1039>
    Geometry Oriented { 
        Primary <0.388927,0.906707,-0.163153>
        Secondary <-0.0402421,0.193648,0.980245>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_362_192770256 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <57.5667,0>
    }
}

Shape SHAPEID_362_196482688 { 
    Id  362
    ParentId  362
    Geometry  GEOMID_362_195918700
    Appearance  APPID_362_192770256
}

Translated GEOMID_366_202141340 { 
    Translation <6.33141,7.16495,40.0209>
    Geometry Oriented { 
        Primary <0.28778,0.761287,0.581055>
        Secondary <-0.92562,0.376808,-0.0352527>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_366_199166440 { 
    Id  366
    ParentId  360
    Geometry  GEOMID_366_202141340
    Appearance  Default
}

Translated GEOMID_368_195573724 { 
    Translation <6.12207,7.25017,40.0129>
    Geometry Oriented { 
        Primary <0.365962,0.91748,-0.155891>
        Secondary <-0.923656,0.378557,0.0596263>
        Geometry Cylinder { 
            Radius 0.220234
            Height 1.39434
            Solid False
        }
    }
}

Texture2D APPID_368_183121552 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <59.9653,0>
    }
}

Shape SHAPEID_368_201338040 { 
    Id  368
    ParentId  360
    Geometry  GEOMID_368_195573724
    Appearance  APPID_368_183121552
}

Translated GEOMID_370_195530180 { 
    Translation <6.18494,7.61882,41.3922>
    Geometry Oriented { 
        Primary <-0.883087,-0.44295,0.154768>
        Secondary <0.181951,-0.0192417,0.983119>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.697169
            Solid False
        }
    }
}

Texture2D APPID_370_196510192 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <59.9653,0>
    }
}

Shape SHAPEID_370_201499088 { 
    Id  370
    ParentId  368
    Geometry  GEOMID_370_195530180
    Appearance  APPID_370_196510192
}

Translated GEOMID_370_169595180 { 
    Translation <5.88342,8.24372,41.4602>
    Geometry Oriented { 
        Primary <-0.883087,-0.44295,0.154768>
        Secondary <0.181951,-0.0192417,0.983119>
        Geometry Scaled { 
            Scale <3.48585,3.48585,3.48585>
            Geometry leaf

        }
    }
}

Texture2D APPID_370_201013432 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <59.9653,0>
    }
}

Shape SHAPEID_370_208218032 { 
    Id  370
    ParentId  370
    Geometry  GEOMID_370_169595180
    Appearance  APPID_370_201013432
}

Translated GEOMID_374_196640908 { 
    Translation <6.18494,7.61882,41.3922>
    Geometry Oriented { 
        Primary <-0.522962,-0.270479,0.808302>
        Secondary <0.43448,-0.900455,-0.0202125>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_374_196509472 { 
    Id  374
    ParentId  368
    Geometry  GEOMID_374_196640908
    Appearance  Default
}

Translated GEOMID_376_194882476 { 
    Translation <6.28063,7.42051,41.3877>
    Geometry Oriented { 
        Primary <-0.894636,-0.421737,0.14753>
        Secondary <0.43526,-0.897203,0.0746648>
        Geometry Cylinder { 
            Radius 0.220234
            Height 1.10419
            Solid False
        }
    }
}

Texture2D APPID_376_200078792 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <62.3639,0>
    }
}

Shape SHAPEID_376_208795000 { 
    Id  376
    ParentId  368
    Geometry  GEOMID_376_194882476
    Appearance  APPID_376_200078792
}

Translated GEOMID_378_193012644 { 
    Translation <6.33043,7.35957,42.5261>
    Geometry Oriented { 
        Primary <0.951374,-0.302808,-0.0565167>
        Secondary <0.139387,0.259575,0.955611>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.552093
            Solid False
        }
    }
}

Texture2D APPID_378_193893872 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <62.3639,0>
    }
}

Shape SHAPEID_378_196690032 { 
    Id  378
    ParentId  376
    Geometry  GEOMID_378_193012644
    Appearance  APPID_378_193893872
}

Translated GEOMID_378_199940756 { 
    Translation <6.17877,6.85329,42.6857>
    Geometry Oriented { 
        Primary <0.951374,-0.302808,-0.0565167>
        Secondary <0.139387,0.259575,0.955611>
        Geometry Scaled { 
            Scale <2.76047,2.76047,2.76047>
            Geometry leaf

        }
    }
}

Texture2D APPID_378_198975456 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <62.3639,0>
    }
}

Shape SHAPEID_378_194870432 { 
    Id  378
    ParentId  378
    Geometry  GEOMID_378_199940756
    Appearance  APPID_378_198975456
}

Translated GEOMID_382_196010876 { 
    Translation <6.33043,7.35957,42.5261>
    Geometry Oriented { 
        Primary <0.758904,-0.0719025,0.647221>
        Secondary <0.279651,0.933559,-0.224193>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_382_194602808 { 
    Id  382
    ParentId  376
    Geometry  GEOMID_382_196010876
    Appearance  Default
}

Translated GEOMID_384_201785276 { 
    Translation <6.39202,7.56517,42.4767>
    Geometry Oriented { 
        Primary <0.953926,-0.294878,-0.0554318>
        Secondary <0.285863,0.949322,-0.130656>
        Geometry Cylinder { 
            Radius 0.214055
            Height 0.375602
            Solid False
        }
    }
}

Texture2D APPID_384_169869168 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <64.7625,0>
    }
}

Shape SHAPEID_384_196607104 { 
    Id  384
    ParentId  376
    Geometry  GEOMID_384_201785276
    Appearance  APPID_384_169869168
}

Translated GEOMID_386_171536332 { 
    Translation <6.61076,7.71406,42.838>
    Geometry Oriented { 
        Primary <-0.503337,0.862767,-0.047807>
        Secondary <-0.0517918,0.0251042,0.998342>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.187801
            Solid False
        }
    }
}

Texture2D APPID_386_171718136 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <64.7625,0>
    }
}

Shape SHAPEID_386_193557176 { 
    Id  386
    ParentId  384
    Geometry  GEOMID_386_171536332
    Appearance  APPID_386_171718136
}

Translated GEOMID_386_183440924 { 
    Translation <6.77274,7.80889,42.8441>
    Geometry Oriented { 
        Primary <-0.503337,0.862767,-0.047807>
        Secondary <-0.0517918,0.0251042,0.998342>
        Geometry Scaled { 
            Scale <0.939006,0.939006,0.939006>
            Geometry leaf

        }
    }
}

Texture2D APPID_386_199830976 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <64.7625,0>
    }
}

Shape SHAPEID_386_191641768 { 
    Id  386
    ParentId  386
    Geometry  GEOMID_386_183440924
    Appearance  APPID_386_199830976
}

Translated GEOMID_390_209551500 { 
    Translation <6.61076,7.71406,42.838>
    Geometry Oriented { 
        Primary <-0.345551,0.655327,0.67167>
        Secondary <-0.861947,-0.504633,0.0489131>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_390_195602840 { 
    Id  390
    ParentId  384
    Geometry  GEOMID_390_209551500
    Appearance  Default
}

Translated GEOMID_392_193610924 { 
    Translation <6.42625,7.60604,42.8485>
    Geometry Oriented { 
        Primary <-0.509936,0.859032,-0.0450501>
        Secondary <-0.854286,-0.499591,0.143542>
        Geometry Cylinder { 
            Radius 0.207598
            Height 0.455336
            Solid False
        }
    }
}

Texture2D APPID_392_208389600 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <67.1611,0>
    }
}

Shape SHAPEID_392_193029808 { 
    Id  392
    ParentId  384
    Geometry  GEOMID_392_193610924
    Appearance  APPID_392_208389600
}

Translated GEOMID_394_169958628 { 
    Translation <6.27158,7.70053,43.3297>
    Geometry Oriented { 
        Primary <-0.182804,-0.974863,0.127379>
        Secondary <0.240367,0.0813136,0.96727>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.227668
            Solid False
        }
    }
}

Texture2D APPID_394_194784056 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <67.1611,0>
    }
}

Shape SHAPEID_394_172177776 { 
    Id  394
    ParentId  392
    Geometry  GEOMID_394_169958628
    Appearance  APPID_394_194784056
}

Translated GEOMID_394_196776124 { 
    Translation <6.05455,7.74776,43.3797>
    Geometry Oriented { 
        Primary <-0.182804,-0.974863,0.127379>
        Secondary <0.240367,0.0813136,0.96727>
        Geometry Scaled { 
            Scale <1.13834,1.13834,1.13834>
            Geometry leaf

        }
    }
}

Texture2D APPID_394_200053712 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <67.1611,0>
    }
}

Shape SHAPEID_394_194541504 { 
    Id  394
    ParentId  394
    Geometry  GEOMID_394_196776124
    Appearance  APPID_394_200053712
}

Translated GEOMID_398_162547460 { 
    Translation <6.27158,7.70053,43.3297>
    Geometry Oriented { 
        Primary <-0.013402,-0.620062,0.784439>
        Secondary <0.966128,-0.210227,-0.149668>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_398_194124016 { 
    Id  398
    ParentId  392
    Geometry  GEOMID_398_162547460
    Appearance  Default
}

Translated GEOMID_400_165717076 { 
    Translation <6.47215,7.65689,43.2987>
    Geometry Oriented { 
        Primary <-0.201717,-0.971598,0.123722>
        Secondary <0.976202,-0.209707,-0.0552414>
        Geometry Cylinder { 
            Radius 0.200827
            Height 1.34964
            Solid False
        }
    }
}

Texture2D APPID_400_206480360 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <69.5597,0>
    }
}

Shape SHAPEID_400_196606944 { 
    Id  400
    ParentId  392
    Geometry  GEOMID_400_165717076
    Appearance  APPID_400_206480360
}

Translated GEOMID_402_201540316 { 
    Translation <6.69605,7.64299,44.6597>
    Geometry Oriented { 
        Primary <0.81934,0.559224,-0.126296>
        Secondary <-0.00598523,0.228624,0.973496>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.674818
            Solid False
        }
    }
}

Texture2D APPID_402_195513496 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <69.5597,0>
    }
}

Shape SHAPEID_402_199636576 { 
    Id  402
    ParentId  400
    Geometry  GEOMID_402_201540316
    Appearance  APPID_402_195513496
}

Translated GEOMID_402_192550596 { 
    Translation <7.08291,7.10525,44.7884>
    Geometry Oriented { 
        Primary <0.81934,0.559224,-0.126296>
        Secondary <-0.00598523,0.228624,0.973496>
        Geometry Scaled { 
            Scale <3.37409,3.37409,3.37409>
            Geometry leaf

        }
    }
}

Texture2D APPID_402_195467800 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <69.5597,0>
    }
}

Shape SHAPEID_402_195586960 { 
    Id  402
    ParentId  402
    Geometry  GEOMID_402_192550596
    Appearance  APPID_402_195467800
}

Translated GEOMID_406_191580868 { 
    Translation <6.69605,7.64299,44.6597>
    Geometry Oriented { 
        Primary <0.600676,0.521582,0.605922>
        Secondary <-0.579842,0.805994,-0.118984>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_406_192940568 { 
    Id  406
    ParentId  400
    Geometry  GEOMID_406_191580868
    Appearance  Default
}

Translated GEOMID_408_196205004 { 
    Translation <6.57961,7.80486,44.6358>
    Geometry Oriented { 
        Primary <0.808799,0.575261,-0.122145>
        Secondary <-0.581863,0.812924,-0.0242877>
        Geometry Cylinder { 
            Radius 0.200827
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_408_195576744 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <71.9583,0>
    }
}

Shape SHAPEID_408_194755848 { 
    Id  408
    ParentId  400
    Geometry  GEOMID_408_196205004
    Appearance  APPID_408_195576744
}

Translated GEOMID_410_195602756 { 
    Translation <6.73001,8.13896,46.1059>
    Geometry Oriented { 
        Primary <-0.990832,0.113114,0.0738766>
        Secondary <0.066168,-0.0704544,0.995318>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_410_201473832 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <71.9583,0>
    }
}

Shape SHAPEID_410_195506128 { 
    Id  410
    ParentId  408
    Geometry  GEOMID_410_195602756
    Appearance  APPID_410_201473832
}

Translated GEOMID_410_200332660 { 
    Translation <6.81747,8.87484,46.1521>
    Geometry Oriented { 
        Primary <-0.990832,0.113114,0.0738766>
        Secondary <0.066168,-0.0704544,0.995318>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_410_199649536 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <71.9583,0>
    }
}

Shape SHAPEID_410_194156728 { 
    Id  410
    ParentId  410
    Geometry  GEOMID_410_200332660
    Appearance  APPID_410_199649536
}

Translated GEOMID_414_195915596 { 
    Translation <6.73001,8.13896,46.1059>
    Geometry Oriented { 
        Primary <-0.646742,0.0898527,0.757398>
        Secondary <-0.118001,-0.992867,0.017026>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_414_195404208 { 
    Id  414
    ParentId  408
    Geometry  GEOMID_414_195915596
    Appearance  Default
}

Translated GEOMID_416_195555644 { 
    Translation <6.70631,7.93957,46.1093>
    Geometry Oriented { 
        Primary <-0.989725,0.124687,0.0699861>
        Secondary <-0.116418,-0.986879,0.111877>
        Geometry Cylinder { 
            Radius 0.193697
            Height 0.849236
            Solid False
        }
    }
}

Texture2D APPID_416_200950272 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <74.3569,0>
    }
}

Shape SHAPEID_416_200102296 { 
    Id  416
    ParentId  408
    Geometry  GEOMID_416_195555644
    Appearance  APPID_416_200950272
}

Translated GEOMID_418_194677100 { 
    Translation <6.63243,7.90356,46.99>
    Geometry Oriented { 
        Primary <0.653582,-0.756496,0.0233082>
        Secondary <0.187644,0.191798,0.963329>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.424618
            Solid False
        }
    }
}

Texture2D APPID_418_193720672 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <74.3569,0>
    }
}

Shape SHAPEID_418_200967384 { 
    Id  418
    ParentId  416
    Geometry  GEOMID_418_194677100
    Appearance  APPID_418_193720672
}

Translated GEOMID_418_201592956 { 
    Translation <6.32109,7.63807,47.1035>
    Geometry Oriented { 
        Primary <0.653582,-0.756496,0.0233082>
        Secondary <0.187644,0.191798,0.963329>
        Geometry Scaled { 
            Scale <2.11266,2.11266,2.11266>
            Geometry leaf

        }
    }
}

Texture2D APPID_418_195232728 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <74.3569,0>
    }
}

Shape SHAPEID_418_194069240 { 
    Id  418
    ParentId  418
    Geometry  GEOMID_418_201592956
    Appearance  APPID_418_195232728
}

Translated GEOMID_422_201540908 { 
    Translation <6.63243,7.90356,46.99>
    Geometry Oriented { 
        Primary <0.558193,-0.430549,0.709259>
        Secondary <0.745418,0.635638,-0.200792>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_422_193059904 { 
    Id  422
    ParentId  416
    Geometry  GEOMID_422_201540908
    Appearance  Default
}

Translated GEOMID_424_192871868 { 
    Translation <6.77681,8.02668,46.9511>
    Geometry Oriented { 
        Primary <0.650969,-0.758762,0.0227896>
        Secondary <0.756198,0.64556,-0.106847>
        Geometry Cylinder { 
            Radius 0.186153
            Height 1.39319
            Solid False
        }
    }
}

Texture2D APPID_424_191760080 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <76.7556,0>
    }
}

Shape SHAPEID_424_208628984 { 
    Id  424
    ParentId  416
    Geometry  GEOMID_424_192871868
    Appearance  APPID_424_191760080
}

Translated GEOMID_426_208662532 { 
    Translation <7.05526,8.14076,48.3393>
    Geometry Oriented { 
        Primary <0.0451165,0.995031,-0.0887568>
        Secondary <-0.0920462,0.0926099,0.991439>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.696594
            Solid False
        }
    }
}

Texture2D APPID_426_165465248 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <76.7556,0>
    }
}

Shape SHAPEID_426_168240584 { 
    Id  426
    ParentId  424
    Geometry  GEOMID_426_208662532
    Appearance  APPID_426_165465248
}

Translated GEOMID_426_196710236 { 
    Translation <7.74818,8.11529,48.4061>
    Geometry Oriented { 
        Primary <0.0451165,0.995031,-0.0887568>
        Secondary <-0.0920462,0.0926099,0.991439>
        Geometry Scaled { 
            Scale <3.40581,3.40581,3.40581>
            Geometry leaf

        }
    }
}

Texture2D APPID_426_203279064 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <76.7556,0>
    }
}

Shape SHAPEID_426_172214936 { 
    Id  426
    ParentId  426
    Geometry  GEOMID_426_196710236
    Appearance  APPID_426_203279064
}

Translated GEOMID_430_191623444 { 
    Translation <7.05526,8.14076,48.3393>
    Geometry Oriented { 
        Primary <0.0164651,0.767253,0.641133>
        Secondary <-0.999158,0.0367232,-0.0182876>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_430_196653136 { 
    Id  430
    ParentId  424
    Geometry  GEOMID_430_191623444
    Appearance  Default
}

Translated GEOMID_432_199657468 { 
    Translation <6.86926,8.14759,48.3359>
    Geometry Oriented { 
        Primary <0.0312997,0.995927,-0.084558>
        Secondary <-0.996336,0.0378247,0.0767003>
        Geometry Cylinder { 
            Radius 0.178124
            Height 1.31444
            Solid False
        }
    }
}

Texture2D APPID_432_200424976 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <79.1542,0>
    }
}

Shape SHAPEID_432_191675544 { 
    Id  432
    ParentId  424
    Geometry  GEOMID_432_199657468
    Appearance  APPID_432_200424976
}

Translated GEOMID_434_195530596 { 
    Translation <6.84718,8.37961,49.6557>
    Geometry Oriented { 
        Primary <-0.683762,-0.720929,0.112833>
        Secondary <0.187756,-0.024396,0.981913>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.657221
            Solid False
        }
    }
}

Texture2D APPID_434_194122152 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <79.1542,0>
    }
}

Shape SHAPEID_434_166832656 { 
    Id  434
    ParentId  432
    Geometry  GEOMID_434_195530596
    Appearance  APPID_434_194122152
}

Translated GEOMID_434_200303420 { 
    Translation <6.38375,8.83479,49.7556>
    Geometry Oriented { 
        Primary <-0.683762,-0.720929,0.112833>
        Secondary <0.187756,-0.024396,0.981913>
        Geometry Scaled { 
            Scale <2.9847,2.9847,2.9847>
            Geometry leaf

        }
    }
}

Texture2D APPID_434_192724456 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <79.1542,0>
    }
}

Shape SHAPEID_434_193851928 { 
    Id  434
    ParentId  434
    Geometry  GEOMID_434_200303420
    Appearance  APPID_434_192724456
}

Translated GEOMID_438_194154556 { 
    Translation <6.84718,8.37961,49.6557>
    Geometry Oriented { 
        Primary <-0.392149,-0.486342,0.780827>
        Secondary <0.711262,-0.698596,-0.0779125>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_438_194547080 { 
    Id  438
    ParentId  432
    Geometry  GEOMID_438_194154556
    Appearance  Default
}

Translated GEOMID_440_192512372 { 
    Translation <6.97387,8.25518,49.6418>
    Geometry Oriented { 
        Primary <-0.696566,-0.709245,0.108476>
        Secondary <0.714652,-0.699273,0.0170233>
        Geometry Cylinder { 
            Radius 0.178124
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_440_193349568 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <81.5528,0>
    }
}

Shape SHAPEID_440_169205232 { 
    Id  440
    ParentId  432
    Geometry  GEOMID_440_192512372
    Appearance  APPID_440_193349568
}

Translated GEOMID_442_192676836 { 
    Translation <7.07853,8.21235,51.1462>
    Geometry Oriented { 
        Primary <0.996929,0.0406868,-0.0669088>
        Secondary <0.0557278,0.231653,0.971201>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_442_165344064 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <81.5528,0>
    }
}

Shape SHAPEID_442_192530264 { 
    Id  442
    ParentId  440
    Geometry  GEOMID_442_192676836
    Appearance  APPID_442_165344064
}

Translated GEOMID_442_193548436 { 
    Translation <7.11937,7.49067,51.316>
    Geometry Oriented { 
        Primary <0.996929,0.0406868,-0.0669088>
        Secondary <0.0557278,0.231653,0.971201>
        Geometry Scaled { 
            Scale <2.56155,2.56155,2.56155>
            Geometry leaf

        }
    }
}

Texture2D APPID_442_196346336 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <81.5528,0>
    }
}

Shape SHAPEID_442_194680592 { 
    Id  442
    ParentId  442
    Geometry  GEOMID_442_193548436
    Appearance  APPID_442_196346336
}

Translated GEOMID_446_194876812 { 
    Translation <7.07853,8.21235,51.1462>
    Geometry Oriented { 
        Primary <0.746909,0.14721,0.648426>
        Secondary <-0.0557886,0.98562,-0.159501>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_446_201388408 { 
    Id  446
    ParentId  440
    Geometry  GEOMID_446_194876812
    Appearance  Default
}

Translated GEOMID_448_200427260 { 
    Translation <7.06859,8.38791,51.1178>
    Geometry Oriented { 
        Primary <0.996591,0.0507291,-0.0650624>
        Secondary <-0.0549653,0.996366,-0.0650626>
        Geometry Cylinder { 
            Radius 0.169515
            Height 1.31394
            Solid False
        }
    }
}

Texture2D APPID_448_209065904 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <83.9514,0>
    }
}

Shape SHAPEID_448_192856232 { 
    Id  448
    ParentId  440
    Geometry  GEOMID_448_200427260
    Appearance  APPID_448_209065904
}

Translated GEOMID_450_193512908 { 
    Translation <7.25714,8.60869,52.4247>
    Geometry Oriented { 
        Primary <-0.772313,0.63523,0.00402059>
        Secondary <-0.0413794,-0.0566228,0.997538>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_450_194150392 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <83.9514,0>
    }
}

Shape SHAPEID_450_191701064 { 
    Id  450
    ParentId  448
    Geometry  GEOMID_450_193512908
    Appearance  APPID_450_194150392
}

Translated GEOMID_450_195912572 { 
    Translation <7.72781,9.1806,52.4767>
    Geometry Oriented { 
        Primary <-0.772313,0.63523,0.00402059>
        Secondary <-0.0413794,-0.0566228,0.997538>
        Geometry Scaled { 
            Scale <1.27595,1.27595,1.27595>
            Geometry leaf

        }
    }
}

Texture2D APPID_450_169154728 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <83.9514,0>
    }
}

Shape SHAPEID_450_200479488 { 
    Id  450
    ParentId  450
    Geometry  GEOMID_450_195912572
    Appearance  APPID_450_169154728
}

Translated GEOMID_454_200386492 { 
    Translation <7.25714,8.60869,52.4247>
    Geometry Oriented { 
        Primary <-0.53976,0.452404,0.709923>
        Secondary <-0.635428,-0.772109,0.008912>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_454_208466856 { 
    Id  454
    ParentId  448
    Geometry  GEOMID_454_200386492
    Appearance  Default
}

Translated GEOMID_456_199859924 { 
    Translation <7.14943,8.4778,52.4262>
    Geometry Oriented { 
        Primary <-0.771912,0.635718,0.00381349>
        Secondary <-0.63198,-0.767996,0.103845>
        Geometry Cylinder { 
            Radius 0.160201
            Height 0.943229
            Solid False
        }
    }
}

Texture2D APPID_456_200848552 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <86.35,0>
    }
}

Shape SHAPEID_456_196010520 { 
    Id  456
    ParentId  448
    Geometry  GEOMID_456_199859924
    Appearance  APPID_456_200848552
}

Translated GEOMID_458_200019716 { 
    Translation <7.05765,8.52942,53.3888>
    Geometry Oriented { 
        Primary <0.151765,-0.98622,0.0658593>
        Secondary <0.210889,0.0974056,0.972645>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_458_199658472 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <86.35,0>
    }
}

Shape SHAPEID_458_200301168 { 
    Id  458
    ParentId  456
    Geometry  GEOMID_458_200019716
    Appearance  APPID_458_199658472
}

Translated GEOMID_458_198490716 { 
    Translation <6.34065,8.43013,53.5543>
    Geometry Oriented { 
        Primary <0.151765,-0.98622,0.0658593>
        Secondary <0.210889,0.0974056,0.972645>
        Geometry Scaled { 
            Scale <0.467066,0.467066,0.467066>
            Geometry leaf

        }
    }
}

Texture2D APPID_458_199778584 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <86.35,0>
    }
}

Shape SHAPEID_458_193021480 { 
    Id  458
    ParentId  458
    Geometry  GEOMID_458_198490716
    Appearance  APPID_458_199778584
}

Translated GEOMID_462_198559716 { 
    Translation <7.05765,8.52942,53.3888>
    Geometry Oriented { 
        Primary <0.204526,-0.635675,0.74437>
        Secondary <0.978855,0.135552,-0.153195>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_462_194764888 { 
    Id  462
    ParentId  456
    Geometry  GEOMID_462_198559716
    Appearance  Default
}

Translated GEOMID_464_196366212 { 
    Translation <7.21446,8.55114,53.3643>
    Geometry Oriented { 
        Primary <0.141984,-0.987799,0.0639865>
        Secondary <0.988649,0.138305,-0.0586884>
        Geometry Cylinder { 
            Radius 0.15
            Height 0.233489
            Solid False
        }
    }
}

Texture2D APPID_464_208155896 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <88.7486,0>
    }
}

Shape SHAPEID_464_200925752 { 
    Id  464
    ParentId  456
    Geometry  GEOMID_464_196366212
    Appearance  APPID_464_208155896
}

Translated GEOMID_466_193003468 { 
    Translation <7.34927,8.48331,53.6087>
    Geometry Oriented { 
        Primary <0.574166,0.81423,-0.0858093>
        Secondary <-0.0762376,0.157521,0.984568>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.366132
            Solid False
        }
    }
}

Texture2D APPID_466_194785168 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <88.7486,0>
    }
}

Shape SHAPEID_466_196603712 { 
    Id  466
    ParentId  464
    Geometry  GEOMID_466_193003468
    Appearance  APPID_466_194785168
}

Translated GEOMID_466_194672620 { 
    Translation <7.64774,8.27873,53.6645>
    Geometry Oriented { 
        Primary <0.574166,0.81423,-0.0858093>
        Secondary <-0.0762376,0.157521,0.984568>
        Geometry Scaled { 
            Scale <0.164192,0.164192,0.164192>
            Geometry leaf

        }
    }
}

Texture2D APPID_466_195129136 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <88.7486,0>
    }
}

Shape SHAPEID_466_196255968 { 
    Id  466
    ParentId  466
    Geometry  GEOMID_466_194672620
    Appearance  APPID_466_195129136
}

Translated GEOMID_470_194567572 { 
    Translation <7.34927,8.48331,53.6087>
    Geometry Oriented { 
        Primary <0.39139,0.660192,0.641062>
        Secondary <-0.822292,0.563637,-0.0784202>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_470_199834824 { 
    Id  470
    ParentId  464
    Geometry  GEOMID_470_194567572
    Appearance  Default
}

Translated GEOMID_472_200161780 { 
    Translation <7.22593,8.56786,53.5969>
    Geometry Oriented { 
        Primary <0.563509,0.82198,-0.0824944>
        Secondary <-0.823903,0.566489,0.0165583>
        Geometry Cylinder { 
            Radius 0.15
            Height 0.0819105
            Solid False
        }
    }
}

Texture2D APPID_472_200202416 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <91.1472,0>
    }
}

Shape SHAPEID_472_200300832 { 
    Id  472
    ParentId  464
    Geometry  GEOMID_472_200161780
    Appearance  APPID_472_200202416
}

Translated GEOMID_474_193445420 { 
    Translation <7.19685,8.71864,53.6841>
    Geometry Oriented { 
        Primary <-0.969513,-0.234343,0.0716094>
        Secondary <0.0959138,-0.0940027,0.990941>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.23533
            Solid False
        }
    }
}

Texture2D APPID_474_208945048 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <91.1472,0>
    }
}

Shape SHAPEID_474_193049440 { 
    Id  474
    ParentId  472
    Geometry  GEOMID_474_193445420
    Appearance  APPID_474_208945048
}

Translated GEOMID_474_192593484 { 
    Translation <7.14379,8.94635,53.7108>
    Geometry Oriented { 
        Primary <-0.969513,-0.234343,0.0716094>
        Secondary <0.0959138,-0.0940027,0.990941>
        Geometry Scaled { 
            Scale <0.13049,0.13049,0.13049>
            Geometry leaf

        }
    }
}

Texture2D APPID_474_200771152 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <91.1472,0>
    }
}

Shape SHAPEID_474_196454688 { 
    Id  474
    ParentId  474
    Geometry  GEOMID_474_192593484
    Appearance  APPID_474_200771152
}

Translated GEOMID_478_196677972 { 
    Translation <7.19685,8.71864,53.6841>
    Geometry Oriented { 
        Primary <-0.630848,-0.175875,0.755711>
        Secondary <0.226802,-0.973231,-0.03717>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_478_200889432 { 
    Id  478
    ParentId  472
    Geometry  GEOMID_478_196677972
    Appearance  Default
}

Translated GEOMID_480_193902556 { 
    Translation <7.19685,8.71864,53.6841>
    Geometry Oriented { 
        Primary <-0.970763,-0.228977,0.0720263>
        Secondary <0.226802,-0.973231,-0.03717>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_480_209032328 { 
    Id  480
    ParentId  472
    Geometry  GEOMID_480_193902556
    Appearance  Default
}

Translated GEOMID_482_194851748 { 
    Translation <0.020399,-0.0611821,13.8287>
    Geometry Oriented { 
        Primary <-0.642316,-0.766437,0.00182576>
        Secondary <0.76643,-0.642295,0.0064846>
        Geometry Cylinder { 
            Radius 0.472311
            Height 1.44503
            Solid False
        }
    }
}

Texture2D APPID_482_209607856 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <47.9722,0>
    }
}

Shape SHAPEID_482_195527784 { 
    Id  482
    ParentId  158
    Geometry  GEOMID_482_194851748
    Appearance  APPID_482_209607856
}

Translated GEOMID_484_208437212 { 
    Translation <0.0766266,-0.519712,15.3135>
    Geometry Oriented { 
        Primary <0.991298,0.131606,0.00299682>
        Secondary <-0.0237164,0.156155,0.987448>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.722516
            Solid False
        }
    }
}

Texture2D APPID_484_209029208 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <47.9722,0>
    }
}

Shape SHAPEID_484_200781608 { 
    Id  484
    ParentId  482
    Geometry  GEOMID_484_208437212
    Appearance  APPID_484_209029208
}

Translated GEOMID_484_199809828 { 
    Translation <0.170182,-1.227,15.4276>
    Geometry Oriented { 
        Primary <0.991298,0.131606,0.00299682>
        Secondary <-0.0237164,0.156155,0.987448>
        Geometry Scaled { 
            Scale <3.61258,3.61258,3.61258>
            Geometry leaf

        }
    }
}

Texture2D APPID_484_196209136 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <47.9722,0>
    }
}

Shape SHAPEID_484_195917032 { 
    Id  484
    ParentId  484
    Geometry  GEOMID_484_199809828
    Appearance  APPID_484_196209136
}

Translated GEOMID_488_193062748 { 
    Translation <0.0149117,-0.0531412,15.2737>
    Geometry Oriented { 
        Primary <0.7255,0.100102,0.680903>
        Secondary <-0.131359,0.991318,-0.00577415>
        Geometry Cylinder { 
            Radius 0.284349
            Solid False
        }
    }
}

Shape SHAPEID_488_192939824 { 
    Id  488
    ParentId  482
    Geometry  GEOMID_488_193062748
    Appearance  APPID_6_201601160
}

Translated GEOMID_489_199531684 { 
    Translation <-0.660658,-0.138395,16.0061>
    Geometry Oriented { 
        Primary <0.750285,0.10323,0.653005>
        Secondary <-0.13157,0.991291,-0.00553757>
        Geometry Cylinder { 
            Radius 0.284349
            Height 0.5
            Solid False
        }
    }
}

Shape SHAPEID_489_199765440 { 
    Id  489
    ParentId  488
    Geometry  GEOMID_489_199531684
    Appearance  Color_3
}

Translated GEOMID_490_194983724 { 
    Translation <-0.984603,-0.179276,16.3848>
    Geometry Oriented { 
        Primary <0.772772,0.10668,0.625654>
        Secondary <-0.142592,0.989754,0.00735885>
        Geometry Cylinder { 
            Radius 0.284349
            Height 0.378419
            Solid False
        }
    }
}

Shape SHAPEID_490_193451200 { 
    Id  490
    ParentId  489
    Geometry  GEOMID_490_194983724
    Appearance  APPID_3_195328248
}

Translated GEOMID_492_208838924 { 
    Translation <-1.10344,0.00634922,16.816>
    Geometry Oriented { 
        Primary <-0.643569,0.633306,-0.429816>
        Secondary <-0.656943,-0.168906,0.734776>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.189209
            Solid False
        }
    }
}

Shape SHAPEID_492_208365376 { 
    Id  492
    ParentId  490
    Geometry  GEOMID_492_208838924
    Appearance  APPID_5_196508344
}

Translated GEOMID_492_199769132 { 
    Translation <-1.02913,0.149248,16.9153>
    Geometry Oriented { 
        Primary <-0.643569,0.633306,-0.429816>
        Secondary <-0.656943,-0.168906,0.734776>
        Geometry Scaled { 
            Scale <0.946046,0.946046,0.946046>
            Geometry leaf

        }
    }
}

Shape SHAPEID_492_194922560 { 
    Id  492
    ParentId  492
    Geometry  GEOMID_492_199769132
    Appearance  APPID_5_196508344
}

Translated GEOMID_496_192598452 { 
    Translation <-1.10344,0.00634922,16.816>
    Geometry Oriented { 
        Primary <-0.914183,0.338799,0.222451>
        Secondary <-0.405146,-0.779101,-0.478391>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_496_192741232 { 
    Id  496
    ParentId  490
    Geometry  GEOMID_496_192598452
    Appearance  Default
}

Translated GEOMID_498_194043988 { 
    Translation <-1.21864,-0.215188,16.6799>
    Geometry Oriented { 
        Primary <-0.680782,0.588069,-0.436704>
        Secondary <-0.441029,-0.805097,-0.396626>
        Geometry Cylinder { 
            Radius 0.280169
            Height 0.193145
            Solid False
        }
    }
}

Texture2D APPID_498_209074264 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_498_195165240 { 
    Id  498
    ParentId  490
    Geometry  GEOMID_498_194043988
    Appearance  APPID_498_209074264
}

Translated GEOMID_500_164936844 { 
    Translation <-1.56775,-0.289181,16.6972>
    Geometry Oriented { 
        Primary <0.215989,-0.974481,0.0611202>
        Secondary <-0.405171,-0.0324987,0.913663>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.0965727
            Solid False
        }
    }
}

Texture2D APPID_500_193468368 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_500_207107408 { 
    Id  500
    ParentId  498
    Geometry  GEOMID_500_164936844
    Appearance  APPID_500_193468368
}

Translated GEOMID_500_172171892 { 
    Translation <-1.65354,-0.310631,16.6584>
    Geometry Oriented { 
        Primary <0.215989,-0.974481,0.0611202>
        Secondary <-0.405171,-0.0324987,0.913663>
        Geometry Scaled { 
            Scale <0.482863,0.482863,0.482863>
            Geometry leaf

        }
    }
}

Texture2D APPID_500_172667992 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_500_202246984 { 
    Id  500
    ParentId  500
    Geometry  GEOMID_500_172171892
    Appearance  APPID_500_172667992
}

Translated GEOMID_504_200113796 { 
    Translation <-1.56775,-0.289181,16.6972>
    Geometry Oriented { 
        Primary <-0.201884,-0.729071,0.653986>
        Secondary <0.842879,0.210734,0.495123>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_504_200478392 { 
    Id  504
    ParentId  498
    Geometry  GEOMID_504_200113796
    Appearance  Default
}

Translated GEOMID_506_199540860 { 
    Translation <-1.3316,-0.23014,16.8359>
    Geometry Oriented { 
        Primary <0.205623,-0.977267,0.0516562>
        Secondary <0.803064,0.198665,0.561801>
        Geometry Cylinder { 
            Radius 0.280169
            Height 0.5
            Solid False
        }
    }
}

Shape SHAPEID_506_195019888 { 
    Id  506
    ParentId  498
    Geometry  GEOMID_506_199540860
    Appearance  Color_3
}

Translated GEOMID_507_193420180 { 
    Translation <-1.61124,-0.267158,17.2487>
    Geometry Oriented { 
        Primary <0.207167,-0.977058,0.0493853>
        Secondary <0.810403,0.199671,0.550798>
        Geometry Cylinder { 
            Radius 0.280169
            Height 0.166483
            Solid False
        }
    }
}

Texture2D APPID_507_209100184 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_507_192709448 { 
    Id  507
    ParentId  506
    Geometry  GEOMID_507_193420180
    Appearance  APPID_507_209100184
}

Translated GEOMID_509_194960236 { 
    Translation <-1.50183,-0.419041,17.5244>
    Geometry Oriented { 
        Primary <0.365634,0.875516,0.315886>
        Secondary <-0.620312,-0.0238097,0.783994>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.0832413
            Solid False
        }
    }
}

Texture2D APPID_509_208208736 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_509_194091048 { 
    Id  509
    ParentId  507
    Geometry  GEOMID_509_194960236
    Appearance  APPID_509_208208736
}

Translated GEOMID_509_193012428 { 
    Translation <-1.44406,-0.459213,17.5689>
    Geometry Oriented { 
        Primary <0.365634,0.875516,0.315886>
        Secondary <-0.620312,-0.0238097,0.783994>
        Geometry Scaled { 
            Scale <0.416206,0.416206,0.416206>
            Geometry leaf

        }
    }
}

Texture2D APPID_509_209567296 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_509_194133448 { 
    Id  509
    ParentId  509
    Geometry  GEOMID_509_193012428
    Appearance  APPID_509_209567296
}

Translated GEOMID_513_196751204 { 
    Translation <-1.50183,-0.419041,17.5244>
    Geometry Oriented { 
        Primary <-0.145693,0.578328,0.802689>
        Secondary <-0.716187,0.498089,-0.48886>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_513_193459408 { 
    Id  513
    ParentId  507
    Geometry  GEOMID_513_196751204
    Appearance  Default
}

Translated GEOMID_515_201070444 { 
    Translation <-1.70248,-0.279492,17.3874>
    Geometry Oriented { 
        Primary <0.404039,0.856698,0.320656>
        Secondary <-0.758646,0.509685,-0.405804>
        Geometry Cylinder { 
            Radius 0.275893
            Height 1.04045
            Solid False
        }
    }
}

Texture2D APPID_515_164956344 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_515_209144280 { 
    Id  515
    ParentId  507
    Geometry  GEOMID_515_201070444
    Appearance  APPID_515_164956344
}

Translated GEOMID_517_194723236 { 
    Translation <-2.31352,-0.0977462,18.2779>
    Geometry Oriented { 
        Primary <-0.83413,-0.208264,-0.510738>
        Secondary <-0.471345,-0.211768,0.856147>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.520226
            Solid False
        }
    }
}

Texture2D APPID_517_199884000 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_517_196066728 { 
    Id  517
    ParentId  515
    Geometry  GEOMID_517_194723236
    Appearance  APPID_517_199884000
}

Translated GEOMID_517_206448580 { 
    Translation <-2.46254,0.399003,18.3188>
    Geometry Oriented { 
        Primary <-0.83413,-0.208264,-0.510738>
        Secondary <-0.471345,-0.211768,0.856147>
        Geometry Scaled { 
            Scale <2.60113,2.60113,2.60113>
            Geometry leaf

        }
    }
}

Texture2D APPID_517_208102920 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_517_200910544 { 
    Id  517
    ParentId  517
    Geometry  GEOMID_517_206448580
    Appearance  APPID_517_208102920
}

Translated GEOMID_521_193004012 { 
    Translation <-2.31352,-0.0977462,18.2779>
    Geometry Oriented { 
        Primary <-0.928634,-0.278596,0.244997>
        Secondary <0.287349,-0.957826,-2.0046e-05>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_521_193825992 { 
    Id  521
    ParentId  515
    Geometry  GEOMID_521_193004012
    Appearance  Default
}

Translated GEOMID_523_197872644 { 
    Translation <-2.23424,-0.362004,18.2779>
    Geometry Oriented { 
        Primary <-0.823963,-0.28893,-0.487448>
        Secondary <0.27999,-0.955481,0.093068>
        Geometry Cylinder { 
            Radius 0.271516
            Height 1.22624
            Solid False
        }
    }
}

Texture2D APPID_523_201329488 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <9.59444,0>
    }
}

Shape SHAPEID_523_194992832 { 
    Id  523
    ParentId  515
    Geometry  GEOMID_523_197872644
    Appearance  APPID_523_201329488
}

Translated GEOMID_525_201590028 { 
    Translation <-2.93537,-0.684613,19.296>
    Geometry Oriented { 
        Primary <0.824561,-0.360788,0.43581>
        Secondary <-0.435245,0.0876296,0.896037>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.61312
            Solid False
        }
    }
}

Texture2D APPID_525_195563976 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <9.59444,0>
    }
}

Shape SHAPEID_525_196521936 { 
    Id  525
    ParentId  523
    Geometry  GEOMID_525_201590028
    Appearance  APPID_525_195563976
}

Translated GEOMID_525_194858372 { 
    Translation <-3.157,-1.25391,19.2441>
    Geometry Oriented { 
        Primary <0.824561,-0.360788,0.43581>
        Secondary <-0.435245,0.0876296,0.896037>
        Geometry Scaled { 
            Scale <3.0656,3.0656,3.0656>
            Geometry leaf

        }
    }
}

Texture2D APPID_525_169179056 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <9.59444,0>
    }
}

Shape SHAPEID_525_196473520 { 
    Id  525
    ParentId  525
    Geometry  GEOMID_525_194858372
    Appearance  APPID_525_169179056
}

Translated GEOMID_529_194806764 { 
    Translation <-2.93537,-0.684613,19.296>
    Geometry Oriented { 
        Primary <0.245665,-0.269247,0.931211>
        Secondary <0.357422,0.918123,0.171171>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_529_194991080 { 
    Id  529
    ParentId  523
    Geometry  GEOMID_529_194806764
    Appearance  Default
}

Translated GEOMID_531_193063068 { 
    Translation <-2.83833,-0.435327,19.3425>
    Geometry Oriented { 
        Primary <0.807432,-0.43086,0.403006>
        Secondary <0.348624,0.899538,0.263234>
        Geometry Cylinder { 
            Radius 0.267032
            Height 1.41639
            Solid False
        }
    }
}

Texture2D APPID_531_191684480 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <11.9931,0>
    }
}

Shape SHAPEID_531_199964984 { 
    Id  531
    ParentId  523
    Geometry  GEOMID_531_193063068
    Appearance  APPID_531_191684480
}

Translated GEOMID_533_201748740 { 
    Translation <-3.30459,-0.440992,20.7212>
    Geometry Oriented { 
        Primary <-0.34866,0.930536,-0.111977>
        Secondary <-0.557605,-0.109915,0.822798>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.708195
            Solid False
        }
    }
}

Texture2D APPID_533_201167488 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <11.9931,0>
    }
}

Shape SHAPEID_533_199048680 { 
    Id  533
    ParentId  531
    Geometry  GEOMID_533_201748740
    Appearance  APPID_533_201167488
}

Translated GEOMID_533_200212332 { 
    Translation <-2.77108,-0.193609,21.1158>
    Geometry Oriented { 
        Primary <-0.34866,0.930536,-0.111977>
        Secondary <-0.557605,-0.109915,0.822798>
        Geometry Scaled { 
            Scale <3.54097,3.54097,3.54097>
            Geometry leaf

        }
    }
}

Texture2D APPID_533_194620232 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <11.9931,0>
    }
}

Shape SHAPEID_533_208438024 { 
    Id  533
    ParentId  533
    Geometry  GEOMID_533_200212332
    Appearance  APPID_533_194620232
}

Translated GEOMID_537_195469716 { 
    Translation <-3.30459,-0.440992,20.7212>
    Geometry Oriented { 
        Primary <-0.616915,0.591354,0.519342>
        Secondary <-0.778389,-0.360933,-0.513651>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_537_191672296 { 
    Id  537
    ParentId  531
    Geometry  GEOMID_537_195469716
    Appearance  Default
}

Translated GEOMID_539_200050180 { 
    Translation <-3.51244,-0.537372,20.584>
    Geometry Oriented { 
        Primary <-0.362574,0.924985,-0.113766>
        Secondary <-0.821294,-0.374827,-0.430094>
        Geometry Cylinder { 
            Radius 0.267032
            Height 1.0779
            Solid False
        }
    }
}

Texture2D APPID_539_196672160 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <14.3917,0>
    }
}

Shape SHAPEID_539_193960088 { 
    Id  539
    ParentId  531
    Geometry  GEOMID_539_200050180
    Appearance  APPID_539_196672160
}

Translated GEOMID_541_209101580 { 
    Translation <-4.22282,-0.50819,21.4689>
    Geometry Oriented { 
        Primary <-0.325671,-0.919573,-0.219828>
        Secondary <-0.275255,-0.130219,0.952511>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.53895
            Solid False
        }
    }
}

Texture2D APPID_541_194552280 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <14.3917,0>
    }
}

Shape SHAPEID_541_193443016 { 
    Id  541
    ParentId  539
    Geometry  GEOMID_541_209101580
    Appearance  APPID_541_194552280
}

Translated GEOMID_541_201417756 { 
    Translation <-4.71032,-0.308394,21.3553>
    Geometry Oriented { 
        Primary <-0.325671,-0.919573,-0.219828>
        Secondary <-0.275255,-0.130219,0.952511>
        Geometry Scaled { 
            Scale <2.69475,2.69475,2.69475>
            Geometry leaf

        }
    }
}

Texture2D APPID_541_196367368 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <14.3917,0>
    }
}

Shape SHAPEID_541_200082952 { 
    Id  541
    ParentId  541
    Geometry  GEOMID_541_201417756
    Appearance  APPID_541_196367368
}

Translated GEOMID_545_171406636 { 
    Translation <-4.22282,-0.50819,21.4689>
    Geometry Oriented { 
        Primary <-0.469387,-0.72409,0.505341>
        Secondary <0.882278,-0.361595,0.301387>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_545_201462520 { 
    Id  545
    ParentId  539
    Geometry  GEOMID_545_171406636
    Appearance  Default
}

Translated GEOMID_547_195148084 { 
    Translation <-3.98723,-0.604747,21.5494>
    Geometry Oriented { 
        Primary <-0.292315,-0.935792,-0.197093>
        Secondary <0.852116,-0.348425,0.390511>
        Geometry Cylinder { 
            Radius 0.262432
            Height 1.11961
            Solid False
        }
    }
}

Texture2D APPID_547_182503936 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <16.7903,0>
    }
}

Shape SHAPEID_547_195574144 { 
    Id  547
    ParentId  539
    Geometry  GEOMID_547_195148084
    Appearance  APPID_547_182503936
}

Translated GEOMID_549_200413324 { 
    Translation <-4.36175,-0.895134,22.615>
    Geometry Oriented { 
        Primary <0.766924,0.504649,0.396431>
        Secondary <-0.487462,0.0563291,0.871325>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.559805
            Solid False
        }
    }
}

Texture2D APPID_549_199968824 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <16.7903,0>
    }
}

Shape SHAPEID_549_208953864 { 
    Id  549
    ParentId  547
    Geometry  GEOMID_549_200413324
    Appearance  APPID_549_199968824
}

Translated GEOMID_549_199613396 { 
    Translation <-4.1281,-1.3774,22.7769>
    Geometry Oriented { 
        Primary <0.766924,0.504649,0.396431>
        Secondary <-0.487462,0.0563291,0.871325>
        Geometry Scaled { 
            Scale <2.79902,2.79902,2.79902>
            Geometry leaf

        }
    }
}

Texture2D APPID_549_195080080 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <16.7903,0>
    }
}

Shape SHAPEID_549_207218048 { 
    Id  549
    ParentId  549
    Geometry  GEOMID_549_199613396
    Appearance  APPID_549_195080080
}

Translated GEOMID_553_192502004 { 
    Translation <-4.36175,-0.895134,22.615>
    Geometry Oriented { 
        Primary <0.224134,0.341922,0.912608>
        Secondary <-0.424911,0.877024,-0.224233>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_553_195127024 { 
    Id  553
    ParentId  547
    Geometry  GEOMID_553_192502004
    Appearance  Default
}

Translated GEOMID_555_192568540 { 
    Translation <-4.47326,-0.664975,22.5562>
    Geometry Oriented { 
        Primary <0.80001,0.455977,0.38996>
        Secondary <-0.441266,0.887537,-0.132526>
        Geometry Cylinder { 
            Radius 0.257709
            Height 1.08091
            Solid False
        }
    }
}

Texture2D APPID_555_200185080 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <19.1889,0>
    }
}

Shape SHAPEID_555_195496984 { 
    Id  555
    ParentId  547
    Geometry  GEOMID_555_192568540
    Appearance  APPID_555_200185080
}

Translated GEOMID_557_200330924 { 
    Translation <-4.85803,-0.491885,23.6016>
    Geometry Oriented { 
        Primary <-0.876846,0.313074,-0.364864>
        Secondary <-0.433354,-0.186035,0.881814>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.540457
            Solid False
        }
    }
}

Texture2D APPID_557_194732136 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <19.1889,0>
    }
}

Shape SHAPEID_557_195067880 { 
    Id  557
    ParentId  555
    Geometry  GEOMID_557_200330924
    Appearance  APPID_557_194732136
}

Translated GEOMID_557_201593220 { 
    Translation <-4.74551,0.0114585,23.7631>
    Geometry Oriented { 
        Primary <-0.876846,0.313074,-0.364864>
        Secondary <-0.433354,-0.186035,0.881814>
        Geometry Scaled { 
            Scale <2.70228,2.70228,2.70228>
            Geometry leaf

        }
    }
}

Texture2D APPID_557_191702856 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <19.1889,0>
    }
}

Shape SHAPEID_557_195468304 { 
    Id  557
    ParentId  557
    Geometry  GEOMID_557_201593220
    Appearance  APPID_557_191702856
}

Translated GEOMID_561_193548988 { 
    Translation <-4.85803,-0.491885,23.6016>
    Geometry Oriented { 
        Primary <-0.92108,0.113856,0.372354>
        Secondary <-0.212077,-0.948695,-0.234522>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_561_194084648 { 
    Id  561
    ParentId  555
    Geometry  GEOMID_561_193548988
    Appearance  Default
}

Translated GEOMID_563_202412812 { 
    Translation <-4.91269,-0.736373,23.5412>
    Geometry Oriented { 
        Primary <-0.895577,0.262496,-0.359219>
        Secondary <-0.225239,-0.963792,-0.142734>
        Geometry Cylinder { 
            Radius 0.252854
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_563_193840520 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <21.5875,0>
    }
}

Shape SHAPEID_563_201499200 { 
    Id  563
    ParentId  555
    Geometry  GEOMID_563_202412812
    Appearance  APPID_563_193840520
}

Translated GEOMID_565_171405068 { 
    Translation <-5.68348,-0.945067,24.846>
    Geometry Oriented { 
        Primary <0.534884,-0.826152,0.177121>
        Secondary <-0.237108,0.054439,0.969957>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_565_193691912 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <21.5875,0>
    }
}

Shape SHAPEID_565_201679600 { 
    Id  565
    ParentId  563
    Geometry  GEOMID_565_171405068
    Appearance  APPID_565_193691912
}

Translated GEOMID_565_195057100 { 
    Translation <-6.28563,-1.36147,24.7221>
    Geometry Oriented { 
        Primary <0.534884,-0.826152,0.177121>
        Secondary <-0.237108,0.054439,0.969957>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_565_200783080 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <21.5875,0>
    }
}

Shape SHAPEID_565_194647000 { 
    Id  565
    ParentId  565
    Geometry  GEOMID_565_195057100
    Appearance  APPID_565_200783080
}

Translated GEOMID_569_208113564 { 
    Translation <-5.68348,-0.945067,24.846>
    Geometry Oriented { 
        Primary <0.15008,-0.587507,0.79518>
        Secondary <0.79505,0.5498,0.256156>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_569_192847992 { 
    Id  569
    ParentId  563
    Geometry  GEOMID_569_208113564
    Appearance  Default
}

Translated GEOMID_571_210087644 { 
    Translation <-5.48245,-0.806048,24.9107>
    Geometry Oriented { 
        Primary <0.511478,-0.844185,0.160442>
        Secondary <0.771552,0.53337,0.346732>
        Geometry Cylinder { 
            Radius 0.252854
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_571_200780664 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <23.9861,0>
    }
}

Shape SHAPEID_571_199793312 { 
    Id  571
    ParentId  563
    Geometry  GEOMID_571_210087644
    Appearance  APPID_571_200780664
}

Translated GEOMID_573_196586732 { 
    Translation <-5.81881,-0.929228,26.3891>
    Geometry Oriented { 
        Primary <0.131186,0.985249,0.109886>
        Secondary <-0.481616,-0.0335452,0.87574>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_573_169988184 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <23.9861,0>
    }
}

Shape SHAPEID_573_199969104 { 
    Id  573
    ParentId  571
    Geometry  GEOMID_573_196586732
    Appearance  APPID_573_169988184
}

Translated GEOMID_573_194110540 { 
    Translation <-5.17543,-1.05382,26.7381>
    Geometry Oriented { 
        Primary <0.131186,0.985249,0.109886>
        Secondary <-0.481616,-0.0335452,0.87574>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_573_194042584 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <23.9861,0>
    }
}

Shape SHAPEID_573_193828000 { 
    Id  573
    ParentId  573
    Geometry  GEOMID_573_194110540
    Appearance  APPID_573_194042584
}

Translated GEOMID_577_194539148 { 
    Translation <-5.81881,-0.929228,26.3891>
    Geometry Oriented { 
        Primary <-0.20828,0.665304,0.716931>
        Secondary <-0.891359,0.17262,-0.419144>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_577_194133832 { 
    Id  577
    ParentId  571
    Geometry  GEOMID_577_194539148
    Appearance  Default
}

Translated GEOMID_579_199563836 { 
    Translation <-6.0442,-0.88558,26.2831>
    Geometry Oriented { 
        Primary <0.146251,0.983066,0.110416>
        Secondary <-0.927158,0.175135,-0.331219>
        Geometry Cylinder { 
            Radius 0.247855
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_579_171262216 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <26.3847,0>
    }
}

Shape SHAPEID_579_196699144 { 
    Id  579
    ParentId  571
    Geometry  GEOMID_579_199563836
    Appearance  APPID_579_171262216
}

Translated GEOMID_581_199949876 { 
    Translation <-6.703,-0.766855,27.654>
    Geometry Oriented { 
        Primary <-0.765249,-0.564362,-0.309662>
        Secondary <-0.249629,-0.183238,0.950847>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_581_165445952 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <26.3847,0>
    }
}

Shape SHAPEID_581_183424552 { 
    Id  581
    ParentId  579
    Geometry  GEOMID_581_199949876
    Appearance  APPID_581_165445952
}

Translated GEOMID_581_178522492 { 
    Translation <-7.14357,-0.169191,27.6535>
    Geometry Oriented { 
        Primary <-0.765249,-0.564362,-0.309662>
        Secondary <-0.249629,-0.183238,0.950847>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_581_192570544 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <26.3847,0>
    }
}

Shape SHAPEID_581_192761496 { 
    Id  581
    ParentId  581
    Geometry  GEOMID_581_178522492
    Appearance  APPID_581_192570544
}

Translated GEOMID_585_192940444 { 
    Translation <-6.703,-0.766855,27.654>
    Geometry Oriented { 
        Primary <-0.739852,-0.498484,0.451812>
        Secondary <0.591302,-0.802139,0.0832704>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_585_196194120 { 
    Id  585
    ParentId  579
    Geometry  GEOMID_585_192940444
    Appearance  Default
}

Translated GEOMID_587_191630340 { 
    Translation <-6.55644,-0.965669,27.6746>
    Geometry Oriented { 
        Primary <-0.739615,-0.607083,-0.290552>
        Secondary <0.581952,-0.793722,0.177023>
        Geometry Cylinder { 
            Radius 0.242702
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_587_196119512 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <28.7833,0>
    }
}

Shape SHAPEID_587_192942064 { 
    Id  587
    ParentId  579
    Geometry  GEOMID_587_191630340
    Appearance  APPID_587_196119512
}

Translated GEOMID_589_196729900 { 
    Translation <-7.07567,-1.2644,29.0749>
    Geometry Oriented { 
        Primary <0.942236,-0.0354553,0.333068>
        Secondary <-0.327455,0.111667,0.938245>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_589_209565624 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <28.7833,0>
    }
}

Shape SHAPEID_589_207102632 { 
    Id  589
    ParentId  587
    Geometry  GEOMID_589_196729900
    Appearance  APPID_589_209565624
}

Translated GEOMID_589_200416092 { 
    Translation <-7.12799,-2.00178,29.1444>
    Geometry Oriented { 
        Primary <0.942236,-0.0354553,0.333068>
        Secondary <-0.327455,0.111667,0.938245>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_589_196264616 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <28.7833,0>
    }
}

Shape SHAPEID_589_196775880 { 
    Id  589
    ParentId  589
    Geometry  GEOMID_589_200416092
    Appearance  APPID_589_196264616
}

Translated GEOMID_593_194774556 { 
    Translation <-7.07567,-1.2644,29.0749>
    Geometry Oriented { 
        Primary <0.429757,-0.0160035,0.902803>
        Secondary <0.0707602,0.997365,-0.0160039>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_593_200447728 { 
    Id  593
    ParentId  587
    Geometry  GEOMID_593_194774556
    Appearance  Default
}

Translated GEOMID_595_196288380 { 
    Translation <-7.0585,-1.02233,29.071>
    Geometry Oriented { 
        Primary <0.944104,-0.0877188,0.317762>
        Secondary <0.0660938,0.994742,0.0782289>
        Geometry Cylinder { 
            Radius 0.23738
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_595_196316048 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <31.1819,0>
    }
}

Shape SHAPEID_595_199946448 { 
    Id  595
    ParentId  587
    Geometry  GEOMID_595_196288380
    Appearance  APPID_595_196316048
}

Translated GEOMID_597_195993268 { 
    Translation <-7.37844,-0.944062,30.5536>
    Geometry Oriented { 
        Primary <-0.635405,0.752431,-0.173517>
        Secondary <-0.406337,-0.134729,0.903736>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_597_199564784 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <31.1819,0>
    }
}

Shape SHAPEID_597_192455408 { 
    Id  597
    ParentId  595
    Geometry  GEOMID_597_195993268
    Appearance  APPID_597_199564784
}

Translated GEOMID_597_192853804 { 
    Translation <-6.8909,-0.46534,30.8441>
    Geometry Oriented { 
        Primary <-0.635405,0.752431,-0.173517>
        Secondary <-0.406337,-0.134729,0.903736>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_597_193535896 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <31.1819,0>
    }
}

Shape SHAPEID_597_197285696 { 
    Id  597
    ParentId  597
    Geometry  GEOMID_597_192853804
    Appearance  APPID_597_193535896
}

Translated GEOMID_601_195538140 { 
    Translation <-7.37844,-0.944062,30.5536>
    Geometry Oriented { 
        Primary <-0.713679,0.45931,0.528864>
        Secondary <-0.672544,-0.66038,-0.334039>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_601_196222200 { 
    Id  601
    ParentId  595
    Geometry  GEOMID_601_195538140
    Appearance  Default
}

Translated GEOMID_603_195373316 { 
    Translation <-7.53809,-1.10082,30.4743>
    Geometry Oriented { 
        Primary <-0.654214,0.736341,-0.172644>
        Secondary <-0.696036,-0.67548,-0.243434>
        Geometry Cylinder { 
            Radius 0.23738
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_603_194600672 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <33.5806,0>
    }
}

Shape SHAPEID_603_191598888 { 
    Id  603
    ParentId  595
    Geometry  GEOMID_603_195373316
    Appearance  APPID_603_194600672
}

Translated GEOMID_605_199596964 { 
    Translation <-8.20976,-1.15901,31.8428>
    Geometry Oriented { 
        Primary <0.00516494,-0.999239,-0.0386495>
        Secondary <-0.117773,-0.0389889,0.992275>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_605_206472680 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <33.5806,0>
    }
}

Shape SHAPEID_605_208708136 { 
    Id  605
    ParentId  603
    Geometry  GEOMID_605_199596964
    Appearance  APPID_605_206472680
}

Translated GEOMID_605_196205364 { 
    Translation <-8.94708,-1.15943,31.7553>
    Geometry Oriented { 
        Primary <0.00516494,-0.999239,-0.0386495>
        Secondary <-0.117773,-0.0389889,0.992275>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_605_178522168 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <33.5806,0>
    }
}

Shape SHAPEID_605_199843648 { 
    Id  605
    ParentId  605
    Geometry  GEOMID_605_196205364
    Appearance  APPID_605_178522168
}

Translated GEOMID_609_194180084 { 
    Translation <-8.20976,-1.15901,31.8428>
    Geometry Oriented { 
        Primary <-0.139172,-0.734173,0.664546>
        Secondary <0.978641,0.000564867,0.205576>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_609_209154216 { 
    Id  609
    ParentId  603
    Geometry  GEOMID_609_194180084
    Appearance  Default
}

Translated GEOMID_611_199830884 { 
    Translation <-7.97745,-1.15887,31.8916>
    Geometry Oriented { 
        Primary <0.0115252,-0.999308,-0.035376>
        Secondary <0.954694,0.000475836,0.29759>
        Geometry Cylinder { 
            Radius 0.231874
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_611_206334920 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <35.9792,0>
    }
}

Shape SHAPEID_611_208486032 { 
    Id  611
    ParentId  603
    Geometry  GEOMID_611_199830884
    Appearance  APPID_611_206334920
}

Translated GEOMID_613_193918668 { 
    Translation <-8.25667,-1.36807,33.3692>
    Geometry Oriented { 
        Primary <0.614764,0.757683,0.219048>
        Secondary <-0.3886,0.0493011,0.920087>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_613_208405440 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <35.9792,0>
    }
}

Shape SHAPEID_613_194075768 { 
    Id  613
    ParentId  611
    Geometry  GEOMID_613_193918668
    Appearance  APPID_613_208405440
}

Translated GEOMID_613_171714716 { 
    Translation <-7.74707,-1.85126,33.6103>
    Geometry Oriented { 
        Primary <0.614764,0.757683,0.219048>
        Secondary <-0.3886,0.0493011,0.920087>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_613_199678672 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <35.9792,0>
    }
}

Shape SHAPEID_613_200025440 { 
    Id  613
    ParentId  613
    Geometry  GEOMID_613_171714716
    Appearance  APPID_613_199678672
}

Translated GEOMID_617_195086860 { 
    Translation <-8.25667,-1.36807,33.3692>
    Geometry Oriented { 
        Primary <0.198471,0.534073,0.821812>
        Secondary <-0.700242,0.663946,-0.262368>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_617_171873712 { 
    Id  617
    ParentId  611
    Geometry  GEOMID_617_195086860
    Appearance  Default
}

Translated GEOMID_619_193851292 { 
    Translation <-8.41904,-1.21412,33.3083>
    Geometry Oriented { 
        Primary <0.639687,0.737639,0.216078>
        Secondary <-0.719263,0.673586,-0.170124>
        Geometry Cylinder { 
            Radius 0.226166
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_619_192813552 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <38.3778,0>
    }
}

Shape SHAPEID_619_169146904 { 
    Id  619
    ParentId  611
    Geometry  GEOMID_619_193851292
    Appearance  APPID_619_192813552
}

Translated GEOMID_621_207026980 { 
    Translation <-8.84362,-1.05932,34.7582>
    Geometry Oriented { 
        Primary <-0.961601,-0.0477457,-0.270268>
        Secondary <-0.25685,-0.190435,0.947503>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_621_207169008 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <38.3778,0>
    }
}

Shape SHAPEID_621_169206104 { 
    Id  621
    ParentId  619
    Geometry  GEOMID_621_207026980
    Appearance  APPID_621_207169008
}

Translated GEOMID_621_192494732 { 
    Translation <-8.91543,-0.331266,34.8851>
    Geometry Oriented { 
        Primary <-0.961601,-0.0477457,-0.270268>
        Secondary <-0.25685,-0.190435,0.947503>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_621_200246496 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <38.3778,0>
    }
}

Shape SHAPEID_621_195131264 { 
    Id  621
    ParentId  621
    Geometry  GEOMID_621_192494732
    Appearance  APPID_621_200246496
}

Translated GEOMID_625_201099172 { 
    Translation <-8.84362,-1.05932,34.7582>
    Geometry Oriented { 
        Primary <-0.865055,-0.133134,0.483689>
        Secondary <0.0976793,-0.99039,-0.0979078>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_625_194026280 { 
    Id  625
    ParentId  619
    Geometry  GEOMID_625_201099172
    Appearance  Default
}

Translated GEOMID_627_194102460 { 
    Translation <-8.82153,-1.28331,34.7361>
    Geometry Oriented { 
        Primary <-0.961249,-0.0891722,-0.26086>
        Secondary <0.0933342,-0.995628,-0.00358474>
        Geometry Cylinder { 
            Radius 0.220234
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_627_201307672 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <40.7764,0>
    }
}

Shape SHAPEID_627_196278608 { 
    Id  627
    ParentId  619
    Geometry  GEOMID_627_194102460
    Appearance  APPID_627_201307672
}

Translated GEOMID_629_193915252 { 
    Translation <-9.33615,-1.50162,36.1494>
    Geometry Oriented { 
        Primary <0.791095,-0.580445,0.193009>
        Secondary <-0.161129,0.106648,0.981154>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_629_194171904 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <40.7764,0>
    }
}

Shape SHAPEID_629_200219552 { 
    Id  629
    ParentId  627
    Geometry  GEOMID_629_193915252
    Appearance  APPID_629_194171904
}

Translated GEOMID_629_193903956 { 
    Translation <-9.77429,-2.10103,36.1426>
    Geometry Oriented { 
        Primary <0.791095,-0.580445,0.193009>
        Secondary <-0.161129,0.106648,0.981154>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_629_200001960 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <40.7764,0>
    }
}

Shape SHAPEID_629_200477984 { 
    Id  629
    ParentId  629
    Geometry  GEOMID_629_193903956
    Appearance  APPID_629_200001960
}

Translated GEOMID_633_208437316 { 
    Translation <-9.33615,-1.50162,36.1494>
    Geometry Oriented { 
        Primary <0.404774,-0.390677,0.826758>
        Secondary <0.587603,0.803882,0.0921821>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_633_201398592 { 
    Id  633
    ParentId  627
    Geometry  GEOMID_633_208437316
    Appearance  Default
}

Translated GEOMID_635_201802228 { 
    Translation <-9.20674,-1.32458,36.1697>
    Geometry Oriented { 
        Primary <0.774292,-0.606501,0.180634>
        Secondary <0.578588,0.794095,0.186145>
        Geometry Cylinder { 
            Radius 0.220234
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_635_172171640 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <43.175,0>
    }
}

Shape SHAPEID_635_208190288 { 
    Id  635
    ParentId  627
    Geometry  GEOMID_635_201802228
    Appearance  APPID_635_172171640
}

Translated GEOMID_637_195312980 { 
    Translation <-9.38237,-1.34547,37.6747>
    Geometry Oriented { 
        Primary <-0.179067,0.983811,-0.00710586>
        Secondary <-0.375095,-0.0615919,0.924938>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_637_172593608 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <43.175,0>
    }
}

Shape SHAPEID_637_200743968 { 
    Id  637
    ParentId  635
    Geometry  GEOMID_637_195312980
    Appearance  APPID_637_172593608
}

Translated GEOMID_637_198912308 { 
    Translation <-8.70704,-1.22052,37.9569>
    Geometry Oriented { 
        Primary <-0.179067,0.983811,-0.00710586>
        Secondary <-0.375095,-0.0615919,0.924938>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_637_206439448 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <43.175,0>
    }
}

Shape SHAPEID_637_207026368 { 
    Id  637
    ParentId  637
    Geometry  GEOMID_637_198912308
    Appearance  APPID_637_206439448
}

Translated GEOMID_641_193421076 { 
    Translation <-9.38237,-1.34547,37.6747>
    Geometry Oriented { 
        Primary <-0.351706,0.659536,0.664316>
        Secondary <-0.930983,-0.172262,-0.321864>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_641_192656896 { 
    Id  641
    ParentId  635
    Geometry  GEOMID_641_193421076
    Appearance  Default
}

Translated GEOMID_643_199769404 { 
    Translation <-9.5874,-1.38341,37.6038>
    Geometry Oriented { 
        Primary <-0.180067,0.983629,-0.00705552>
        Secondary <-0.956875,-0.176823,-0.230487>
        Geometry Cylinder { 
            Radius 0.214055
            Height 1.44561
            Solid False
        }
    }
}

Texture2D APPID_643_195355896 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <45.5736,0>
    }
}

Shape SHAPEID_643_193421104 { 
    Id  643
    ParentId  635
    Geometry  GEOMID_643_199769404
    Appearance  APPID_643_195355896
}

Translated GEOMID_645_196777284 { 
    Translation <-10.0961,-1.31798,38.9916>
    Geometry Oriented { 
        Primary <-0.535446,-0.830621,-0.152861>
        Secondary <-0.0873514,-0.125558,0.988233>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.722807
            Solid False
        }
    }
}

Texture2D APPID_645_191660912 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <45.5736,0>
    }
}

Shape SHAPEID_645_196777312 { 
    Id  645
    ParentId  643
    Geometry  GEOMID_645_196777284
    Appearance  APPID_645_191660912
}

Translated GEOMID_645_196108404 { 
    Translation <-10.7032,-0.925855,38.9878>
    Geometry Oriented { 
        Primary <-0.535446,-0.830621,-0.152861>
        Secondary <-0.0873514,-0.125558,0.988233>
        Geometry Scaled { 
            Scale <3.61404,3.61404,3.61404>
            Geometry leaf

        }
    }
}

Texture2D APPID_645_200335928 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <45.5736,0>
    }
}

Shape SHAPEID_645_195606016 { 
    Id  645
    ParentId  645
    Geometry  GEOMID_645_196108404
    Appearance  APPID_645_200335928
}

Translated GEOMID_649_201236524 { 
    Translation <-10.0961,-1.31798,38.9916>
    Geometry Oriented { 
        Primary <-0.481491,-0.649574,0.588405>
        Secondary <0.836781,-0.540393,0.0881659>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_649_196108432 { 
    Id  649
    ParentId  643
    Geometry  GEOMID_649_201236524
    Appearance  Default
}

Translated GEOMID_651_199058508 { 
    Translation <-9.91694,-1.43365,39.0105>
    Geometry Oriented { 
        Primary <-0.515493,-0.844856,-0.143128>
        Secondary <0.825318,-0.534448,0.182252>
        Geometry Cylinder { 
            Radius 0.207598
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_651_165405408 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <47.9722,0>
    }
}

Shape SHAPEID_651_201236552 { 
    Id  651
    ParentId  643
    Geometry  GEOMID_651_199058508
    Appearance  APPID_651_165405408
}

Translated GEOMID_653_199742684 { 
    Translation <-10.2055,-1.66868,40.4788>
    Geometry Oriented { 
        Primary <0.928796,0.294609,0.22482>
        Secondary <-0.26809,0.115299,0.956469>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_653_193430288 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <47.9722,0>
    }
}

Shape SHAPEID_653_199742712 { 
    Id  653
    ParentId  651
    Geometry  GEOMID_653_199742684
    Appearance  APPID_653_193430288
}

Translated GEOMID_653_209205780 { 
    Translation <-10.0155,-2.37304,40.6169>
    Geometry Oriented { 
        Primary <0.928796,0.294609,0.22482>
        Secondary <-0.26809,0.115299,0.956469>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_653_196760064 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <47.9722,0>
    }
}

Shape SHAPEID_653_192564960 { 
    Id  653
    ParentId  653
    Geometry  GEOMID_653_209205780
    Appearance  APPID_653_196760064
}

Translated GEOMID_657_200075052 { 
    Translation <-10.2055,-1.66868,40.4788>
    Geometry Oriented { 
        Primary <0.483125,0.230766,0.844593>
        Secondary <-0.258711,0.959194,-0.11409>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_657_209205808 { 
    Id  657
    ParentId  651
    Geometry  GEOMID_657_200075052
    Appearance  Default
}

Translated GEOMID_659_194572476 { 
    Translation <-10.2592,-1.46955,40.4551>
    Geometry Oriented { 
        Primary <0.94018,0.262287,0.217411>
        Secondary <-0.264439,0.964202,-0.0196737>
        Geometry Cylinder { 
            Radius 0.200827
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_659_194825840 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <50.3708,0>
    }
}

Shape SHAPEID_659_200075080 { 
    Id  659
    ParentId  651
    Geometry  GEOMID_659_194572476
    Appearance  APPID_659_194825840
}

Translated GEOMID_661_193570212 { 
    Translation <-10.4908,-1.35128,41.9451>
    Geometry Oriented { 
        Primary <-0.861153,0.479558,-0.16864>
        Secondary <-0.274788,-0.16004,0.948092>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_661_208721488 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <50.3708,0>
    }
}

Shape SHAPEID_661_193570240 { 
    Id  661
    ParentId  659
    Geometry  GEOMID_661_193570212
    Appearance  APPID_661_208721488
}

Translated GEOMID_661_206421604 { 
    Translation <-10.1733,-0.710658,42.1452>
    Geometry Oriented { 
        Primary <-0.861153,0.479558,-0.16864>
        Secondary <-0.274788,-0.16004,0.948092>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_661_208632120 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <50.3708,0>
    }
}

Shape SHAPEID_661_206382744 { 
    Id  661
    ParentId  661
    Geometry  GEOMID_661_206421604
    Appearance  APPID_661_208632120
}

Translated GEOMID_665_209174804 { 
    Translation <-10.4908,-1.35128,41.9451>
    Geometry Oriented { 
        Primary <-0.786365,0.25996,0.560402>
        Secondary <-0.434851,-0.877267,-0.203241>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_665_206421632 { 
    Id  665
    ParentId  659
    Geometry  GEOMID_665_209174804
    Appearance  Default
}

Translated GEOMID_667_201458892 { 
    Translation <-10.5782,-1.52746,41.9043>
    Geometry Oriented { 
        Primary <-0.873591,0.457827,-0.165023>
        Secondary <-0.445066,-0.888761,-0.109636>
        Geometry Cylinder { 
            Radius 0.200827
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_667_192940472 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <52.7694,0>
    }
}

Shape SHAPEID_667_209174832 { 
    Id  667
    ParentId  659
    Geometry  GEOMID_667_201458892
    Appearance  APPID_667_192940472
}

Translated GEOMID_669_199886660 { 
    Translation <-11.0574,-1.63103,43.3387>
    Geometry Oriented { 
        Primary <0.35115,-0.935063,0.0484924>
        Secondary <-0.037198,0.0378178,0.998592>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_669_208656120 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <52.7694,0>
    }
}

Shape SHAPEID_669_171253840 { 
    Id  669
    ParentId  667
    Geometry  GEOMID_669_199886660
    Appearance  APPID_669_208656120
}

Translated GEOMID_669_196462532 { 
    Translation <-11.7521,-1.89273,43.3227>
    Geometry Oriented { 
        Primary <0.35115,-0.935063,0.0484924>
        Secondary <-0.037198,0.0378178,0.998592>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_669_199855296 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <52.7694,0>
    }
}

Shape SHAPEID_669_198601472 { 
    Id  669
    ParentId  669
    Geometry  GEOMID_669_196462532
    Appearance  APPID_669_199855296
}

Translated GEOMID_673_193894204 { 
    Translation <-11.0574,-1.63103,43.3387>
    Geometry Oriented { 
        Primary <0.164052,-0.656278,0.736469>
        Secondary <0.930612,0.350588,0.105115>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_673_208258544 { 
    Id  673
    ParentId  667
    Geometry  GEOMID_673_193894204
    Appearance  Default
}

Translated GEOMID_675_208551052 { 
    Translation <-10.8705,-1.56062,43.3598>
    Geometry Oriented { 
        Primary <0.343895,-0.937917,0.0452528>
        Secondary <0.916942,0.345809,0.199079>
        Geometry Cylinder { 
            Radius 0.193697
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_675_199751480 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <55.1681,0>
    }
}

Shape SHAPEID_675_165631712 { 
    Id  675
    ParentId  667
    Geometry  GEOMID_675_208551052
    Appearance  APPID_675_199751480
}

Translated GEOMID_677_191696444 { 
    Translation <-10.9977,-1.67292,44.8611>
    Geometry Oriented { 
        Primary <0.353452,0.930333,0.0977348>
        Secondary <-0.32317,0.0233925,0.946052>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_677_197333552 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <55.1681,0>
    }
}

Shape SHAPEID_677_208097808 { 
    Id  677
    ParentId  675
    Geometry  GEOMID_677_191696444
    Appearance  APPID_677_197333552
}

Translated GEOMID_677_195268028 { 
    Translation <-10.3459,-1.94466,45.0904>
    Geometry Oriented { 
        Primary <0.353452,0.930333,0.0977348>
        Secondary <-0.32317,0.0233925,0.946052>
        Geometry Scaled { 
            Scale <3.69377,3.69377,3.69377>
            Geometry leaf

        }
    }
}

Texture2D APPID_677_200757904 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <55.1681,0>
    }
}

Shape SHAPEID_677_191588128 { 
    Id  677
    ParentId  677
    Geometry  GEOMID_677_195268028
    Appearance  APPID_677_200757904
}

Translated GEOMID_681_192448244 { 
    Translation <-10.9977,-1.67292,44.8611>
    Geometry Oriented { 
        Primary <0.0669235,0.655413,0.7523>
        Secondary <-0.894784,0.373025,-0.245385>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_681_195195168 { 
    Id  681
    ParentId  675
    Geometry  GEOMID_681_192448244
    Appearance  Default
}

Translated GEOMID_683_192558484 { 
    Translation <-11.171,-1.60067,44.8135>
    Geometry Oriented { 
        Primary <0.366857,0.925297,0.0961324>
        Secondary <-0.913232,0.377898,-0.152315>
        Geometry Cylinder { 
            Radius 0.186153
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_683_194816256 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <57.5667,0>
    }
}

Shape SHAPEID_683_195927928 { 
    Id  683
    ParentId  675
    Geometry  GEOMID_683_192558484
    Appearance  APPID_683_194816256
}

Translated GEOMID_685_194824324 { 
    Translation <-11.5135,-1.47973,46.2805>
    Geometry Oriented { 
        Primary <-0.899119,-0.402101,-0.172915>
        Secondary <-0.111191,-0.172265,0.978755>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_685_195538168 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <57.5667,0>
    }
}

Shape SHAPEID_685_200386976 { 
    Id  685
    ParentId  683
    Geometry  GEOMID_685_194824324
    Appearance  APPID_685_195538168
}

Translated GEOMID_685_199973988 { 
    Translation <-11.8278,-0.812045,46.3623>
    Geometry Oriented { 
        Primary <-0.899119,-0.402101,-0.172915>
        Secondary <-0.111191,-0.172265,0.978755>
        Geometry Scaled { 
            Scale <3.63007,3.63007,3.63007>
            Geometry leaf

        }
    }
}

Texture2D APPID_685_200392088 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <57.5667,0>
    }
}

Shape SHAPEID_685_199863416 { 
    Id  685
    ParentId  685
    Geometry  GEOMID_685_199973988
    Appearance  APPID_685_200392088
}

Translated GEOMID_689_193377316 { 
    Translation <-11.5135,-1.47973,46.2805>
    Geometry Oriented { 
        Primary <-0.733113,-0.366382,0.572983>
        Secondary <0.425699,-0.904243,-0.0335318>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_689_193784560 { 
    Id  689
    ParentId  683
    Geometry  GEOMID_689_193377316
    Appearance  Default
}

Translated GEOMID_691_200136812 { 
    Translation <-11.4342,-1.64806,46.2743>
    Geometry Oriented { 
        Primary <-0.88902,-0.427034,-0.165184>
        Secondary <0.422886,-0.904106,0.0613214>
        Geometry Cylinder { 
            Radius 0.178124
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_691_200462736 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <59.9653,0>
    }
}

Shape SHAPEID_691_206357608 { 
    Id  691
    ParentId  683
    Geometry  GEOMID_691_200136812
    Appearance  APPID_691_200462736
}

Translated GEOMID_693_197858020 { 
    Translation <-11.7465,-1.84132,47.7388>
    Geometry Oriented { 
        Primary <0.948702,-0.270998,0.162865>
        Secondary <-0.129997,0.135226,0.98225>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_693_199588848 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <59.9653,0>
    }
}

Shape SHAPEID_693_194678424 { 
    Id  693
    ParentId  691
    Geometry  GEOMID_693_197858020
    Appearance  APPID_693_199588848
}

Translated GEOMID_693_193654036 { 
    Translation <-11.9605,-2.54894,47.8079>
    Geometry Oriented { 
        Primary <0.948702,-0.270998,0.162865>
        Secondary <-0.129997,0.135226,0.98225>
        Geometry Scaled { 
            Scale <3.37043,3.37043,3.37043>
            Geometry leaf

        }
    }
}

Texture2D APPID_693_193870984 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <59.9653,0>
    }
}

Shape SHAPEID_693_199227808 { 
    Id  693
    ParentId  693
    Geometry  GEOMID_693_193654036
    Appearance  APPID_693_193870984
}

Translated GEOMID_697_192461444 { 
    Translation <-11.7465,-1.84132,47.7388>
    Geometry Oriented { 
        Primary <0.560636,-0.156438,0.813151>
        Secondary <0.289433,0.957074,-0.0154265>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_697_192517816 { 
    Id  697
    ParentId  691
    Geometry  GEOMID_697_192461444
    Appearance  Default
}

Translated GEOMID_699_169984508 { 
    Translation <-11.6949,-1.67084,47.736>
    Geometry Oriented { 
        Primary <0.942597,-0.295706,0.155139>
        Secondary <0.286461,0.954794,0.079421>
        Geometry Cylinder { 
            Radius 0.178124
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_699_200969016 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <62.3639,0>
    }
}

Shape SHAPEID_699_192721640 { 
    Id  699
    ParentId  691
    Geometry  GEOMID_699_169984508
    Appearance  APPID_699_200969016
}

Translated GEOMID_701_194517052 { 
    Translation <-11.8008,-1.62748,49.2397>
    Geometry Oriented { 
        Primary <-0.49437,0.867262,-0.0587797>
        Secondary <-0.286018,-0.0984394,0.953154>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_701_208463240 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <62.3639,0>
    }
}

Shape SHAPEID_701_195313192 { 
    Id  701
    ParentId  699
    Geometry  GEOMID_701_194517052
    Appearance  APPID_701_208463240
}

Translated GEOMID_701_196286476 { 
    Translation <-11.1914,-1.26512,49.46>
    Geometry Oriented { 
        Primary <-0.49437,0.867262,-0.0587797>
        Secondary <-0.286018,-0.0984394,0.953154>
        Geometry Scaled { 
            Scale <2.56155,2.56155,2.56155>
            Geometry leaf

        }
    }
}

Texture2D APPID_701_195086888 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <62.3639,0>
    }
}

Shape SHAPEID_701_199886688 { 
    Id  701
    ParentId  701
    Geometry  GEOMID_701_196286476
    Appearance  APPID_701_195086888
}

Translated GEOMID_705_207051236 { 
    Translation <-11.8008,-1.62748,49.2397>
    Geometry Oriented { 
        Primary <-0.515146,0.565443,0.644127>
        Secondary <-0.836046,-0.497058,-0.232295>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_705_209213136 { 
    Id  705
    ParentId  699
    Geometry  GEOMID_705_207051236
    Appearance  Default
}

Translated GEOMID_707_198886532 { 
    Translation <-11.9498,-1.71601,49.1983>
    Geometry Oriented { 
        Primary <-0.501891,0.863003,-0.0577122>
        Secondary <-0.851999,-0.504781,-0.138905>
        Geometry Cylinder { 
            Radius 0.169515
            Height 1.31394
            Solid False
        }
    }
}

Texture2D APPID_707_193807688 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <64.7625,0>
    }
}

Shape SHAPEID_707_196163680 { 
    Id  707
    ParentId  699
    Geometry  GEOMID_707_198886532
    Appearance  APPID_707_193807688
}

Translated GEOMID_709_208516844 { 
    Translation <-12.3109,-1.70696,50.4878>
    Geometry Oriented { 
        Primary <-0.213998,-0.97546,-0.0517973>
        Secondary <0.0134599,-0.0559652,0.998342>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_709_192494760 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <64.7625,0>
    }
}

Shape SHAPEID_709_192913376 { 
    Id  709
    ParentId  707
    Geometry  GEOMID_709_208516844
    Appearance  APPID_709_192494760
}

Translated GEOMID_709_207123572 { 
    Translation <-13.0361,-1.54884,50.5064>
    Geometry Oriented { 
        Primary <-0.213998,-0.97546,-0.0517973>
        Secondary <0.0134599,-0.0559652,0.998342>
        Geometry Scaled { 
            Scale <1.27595,1.27595,1.27595>
            Geometry leaf

        }
    }
}

Texture2D APPID_709_194102488 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <64.7625,0>
    }
}

Shape SHAPEID_709_193858760 { 
    Id  709
    ParentId  709
    Geometry  GEOMID_709_207123572
    Appearance  APPID_709_194102488
}

Translated GEOMID_713_199610220 { 
    Translation <-12.3109,-1.70696,50.4878>
    Geometry Oriented { 
        Primary <-0.194997,-0.71773,0.668461>
        Secondary <0.975504,-0.212676,0.0562136>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_713_192849184 { 
    Id  713
    ParentId  707
    Geometry  GEOMID_713_199610220
    Appearance  Default
}

Translated GEOMID_715_196009908 { 
    Translation <-12.1455,-1.74301,50.4973>
    Geometry Oriented { 
        Primary <-0.205986,-0.97734,-0.0487506>
        Secondary <0.965773,-0.211068,0.150771>
        Geometry Cylinder { 
            Radius 0.160201
            Height 0.943229
            Solid False
        }
    }
}

Texture2D APPID_715_193915280 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <67.1611,0>
    }
}

Shape SHAPEID_715_207050968 { 
    Id  715
    ParentId  707
    Geometry  GEOMID_715_196009908
    Appearance  APPID_715_193915280
}

Translated GEOMID_717_194025820 { 
    Translation <-12.2033,-1.8877,51.453>
    Geometry Oriented { 
        Primary <0.792919,0.594235,0.134778>
        Secondary <-0.239447,0.100478,0.965696>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_717_193905464 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <67.1611,0>
    }
}

Shape SHAPEID_717_192539112 { 
    Id  717
    ParentId  715
    Geometry  GEOMID_717_194025820
    Appearance  APPID_717_193905464
}

Translated GEOMID_717_206337700 { 
    Translation <-11.7872,-2.48021,51.6178>
    Geometry Oriented { 
        Primary <0.792919,0.594235,0.134778>
        Secondary <-0.239447,0.100478,0.965696>
        Geometry Scaled { 
            Scale <0.467066,0.467066,0.467066>
            Geometry leaf

        }
    }
}

Texture2D APPID_717_200435136 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <67.1611,0>
    }
}

Shape SHAPEID_717_199204768 { 
    Id  717
    ParentId  717
    Geometry  GEOMID_717_206337700
    Appearance  APPID_717_200435136
}

Translated GEOMID_721_201365628 { 
    Translation <-12.2033,-1.8877,51.453>
    Geometry Oriented { 
        Primary <0.423293,0.445762,0.788745>
        Secondary <-0.567935,0.808853,-0.152334>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_721_193039264 { 
    Id  721
    ParentId  715
    Geometry  GEOMID_721_201365628
    Appearance  Default
}

Translated GEOMID_723_194052492 { 
    Translation <-12.2942,-1.75812,51.4286>
    Geometry Oriented { 
        Primary <0.805331,0.578179,0.130961>
        Secondary <-0.575986,0.815403,-0.0579532>
        Geometry Cylinder { 
            Radius 0.15
            Height 0.326427
            Solid False
        }
    }
}

Texture2D APPID_723_207186976 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <69.5597,0>
    }
}

Shape SHAPEID_723_200185360 { 
    Id  723
    ParentId  715
    Geometry  GEOMID_723_194052492
    Appearance  APPID_723_207186976
}

Translated GEOMID_725_195540372 { 
    Translation <-12.3222,-1.61969,51.7699>
    Geometry Oriented { 
        Primary <-0.980488,0.144492,-0.133289>
        Secondary <-0.15776,-0.173828,0.972057>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.538917
            Solid False
        }
    }
}

Texture2D APPID_725_201336688 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <69.5597,0>
    }
}

Shape SHAPEID_725_195085000 { 
    Id  725
    ParentId  723
    Geometry  GEOMID_725_195540372
    Appearance  APPID_725_201336688
}

Translated GEOMID_725_182371308 { 
    Translation <-12.259,-1.09472,51.8741>
    Geometry Oriented { 
        Primary <-0.980488,0.144492,-0.133289>
        Secondary <-0.15776,-0.173828,0.972057>
        Geometry Scaled { 
            Scale <0.184042,0.184042,0.184042>
            Geometry leaf

        }
    }
}

Texture2D APPID_725_196216360 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <69.5597,0>
    }
}

Shape SHAPEID_725_208551080 { 
    Id  725
    ParentId  725
    Geometry  GEOMID_725_182371308
    Appearance  APPID_725_196216360
}

Translated GEOMID_729_196500916 { 
    Translation <-12.3222,-1.61969,51.7699>
    Geometry Oriented { 
        Primary <-0.799694,0.0221781,0.599997>
        Secondary <-0.118649,-0.985448,-0.121713>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_729_194883984 { 
    Id  729
    ParentId  723
    Geometry  GEOMID_729_196500916
    Appearance  Default
}

Translated GEOMID_731_195927356 { 
    Translation <-12.34,-1.76751,51.7517>
    Geometry Oriented { 
        Primary <-0.9838,0.124524,-0.128962>
        Secondary <-0.122035,-0.992157,-0.0270538>
        Geometry Cylinder { 
            Radius 0.15
            Height 0.155369
            Solid False
        }
    }
}

Texture2D APPID_731_202281312 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <71.9583,0>
    }
}

Shape SHAPEID_731_196520912 { 
    Id  731
    ParentId  723
    Geometry  GEOMID_731_195927356
    Appearance  APPID_731_202281312
}

Translated GEOMID_733_201092172 { 
    Translation <-12.4743,-1.86684,51.9022>
    Geometry Oriented { 
        Primary <0.652466,-0.753883,0.0771252>
        Secondary <-0.00769005,0.0951809,0.99543>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.719511
            Solid False
        }
    }
}

Texture2D APPID_733_206386608 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <71.9583,0>
    }
}

Shape SHAPEID_733_193377344 { 
    Id  733
    ParentId  731
    Geometry  GEOMID_733_201092172
    Appearance  APPID_733_206386608
}

Translated GEOMID_733_207029412 { 
    Translation <-13.0195,-2.33458,51.9427>
    Geometry Oriented { 
        Primary <0.652466,-0.753883,0.0771252>
        Secondary <-0.00769005,0.0951809,0.99543>
        Geometry Scaled { 
            Scale <0.143127,0.143127,0.143127>
            Geometry leaf

        }
    }
}

Texture2D APPID_733_200053120 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <71.9583,0>
    }
}

Shape SHAPEID_733_192944224 { 
    Id  733
    ParentId  733
    Geometry  GEOMID_733_207029412
    Appearance  APPID_733_200053120
}

Translated GEOMID_737_196014876 { 
    Translation <-12.4743,-1.86684,51.9022>
    Geometry Oriented { 
        Primary <0.409989,-0.50518,0.759409>
        Secondary <0.758775,0.650933,0.0233716>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_737_197101712 { 
    Id  737
    ParentId  731
    Geometry  GEOMID_737_196014876
    Appearance  Default
}

Translated GEOMID_739_193781372 { 
    Translation <-12.4743,-1.86684,51.9022>
    Geometry Oriented { 
        Primary <0.647795,-0.75789,0.0772267>
        Secondary <0.758775,0.650933,0.0233716>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_739_165634856 { 
    Id  739
    ParentId  731
    Geometry  GEOMID_739_193781372
    Appearance  Default
}

Translated GEOMID_741_207207596 { 
    Translation <0.0149117,-0.0531412,15.2737>
    Geometry Oriented { 
        Primary <0.991358,0.13115,0.00288311>
        Secondary <-0.131174,0.9913,0.0108666>
        Geometry Cylinder { 
            Radius 0.415678
            Height 1.5
            Solid False
        }
    }
}

Texture2D APPID_741_195240408 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <50.3708,0>
    }
}

Shape SHAPEID_741_199815352 { 
    Id  741
    ParentId  482
    Geometry  GEOMID_741_207207596
    Appearance  APPID_741_195240408
}

Translated GEOMID_743_202412932 { 
    Translation <0.250052,0.269465,16.8102>
    Geometry Oriented { 
        Primary <-0.819979,0.572371,0.00514757>
        Secondary <-0.0882356,-0.135282,0.98687>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.75
            Solid False
        }
    }
}

Texture2D APPID_743_199542344 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <50.3708,0>
    }
}

Shape SHAPEID_743_207158120 { 
    Id  743
    ParentId  741
    Geometry  GEOMID_743_202412932
    Appearance  APPID_743_199542344
}

Translated GEOMID_743_194504732 { 
    Translation <0.674216,0.876034,16.9312>
    Geometry Oriented { 
        Primary <-0.819979,0.572371,0.00514757>
        Secondary <-0.0882356,-0.135282,0.98687>
        Geometry Scaled { 
            Scale <3.75,3.75,3.75>
            Geometry leaf

        }
    }
}

Texture2D APPID_743_207118352 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <50.3708,0>
    }
}

Shape SHAPEID_743_208722392 { 
    Id  743
    ParentId  743
    Geometry  GEOMID_743_194504732
    Appearance  APPID_743_207118352
}

Translated GEOMID_747_200065164 { 
    Translation <0.250052,0.269465,16.8102>
    Geometry Oriented { 
        Primary <-0.612248,0.351907,0.708035>
        Secondary <-0.570851,-0.816336,-0.087888>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_747_169239192 { 
    Id  747
    ParentId  741
    Geometry  GEOMID_747_200065164
    Appearance  Default
}

Translated GEOMID_749_208196868 { 
    Translation <0.0127624,-0.0698676,16.7736>
    Geometry Oriented { 
        Primary <-0.819528,0.573017,0.00495495>
        Secondary <-0.572981,-0.819538,0.00711866>
        Geometry Cylinder { 
            Radius 0.413319
            Height 1.0005
            Solid False
        }
    }
}

Texture2D APPID_749_194057280 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <52.7694,0>
    }
}

Shape SHAPEID_749_200407264 { 
    Id  749
    ParentId  741
    Geometry  GEOMID_749_208196868
    Appearance  APPID_749_194057280
}

Translated GEOMID_751_194806028 { 
    Translation <-0.381039,-0.15627,17.8099>
    Geometry Oriented { 
        Primary <0.21729,-0.976106,0.00114124>
        Secondary <0.156144,0.0359133,0.987081>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.50025
            Solid False
        }
    }
}

Texture2D APPID_751_172076840 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <52.7694,0>
    }
}

Shape SHAPEID_751_195971816 { 
    Id  751
    ParentId  749
    Geometry  GEOMID_751_194806028
    Appearance  APPID_751_172076840
}

Translated GEOMID_751_201091796 { 
    Translation <-0.863048,-0.263476,17.89>
    Geometry Oriented { 
        Primary <0.21729,-0.976106,0.00114124>
        Secondary <0.156144,0.0359133,0.987081>
        Geometry Scaled { 
            Scale <2.50125,2.50125,2.50125>
            Geometry leaf

        }
    }
}

Texture2D APPID_751_196729928 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <52.7694,0>
    }
}

Shape SHAPEID_751_193784944 { 
    Id  751
    ParentId  751
    Geometry  GEOMID_751_201091796
    Appearance  APPID_751_196729928
}

Translated GEOMID_755_192917260 { 
    Translation <-0.381039,-0.15627,17.8099>
    Geometry Oriented { 
        Primary <0.213184,-0.676132,0.705264>
        Secondary <0.97248,0.216294,-0.0865975>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_755_201721744 { 
    Id  755
    ParentId  749
    Geometry  GEOMID_755_192917260
    Appearance  Default
}

Translated GEOMID_757_200052932 { 
    Translation <0.0209063,-0.0668712,17.7741>
    Geometry Oriented { 
        Primary <0.217119,-0.976145,0.00109832>
        Secondary <0.976115,0.217103,-0.00816615>
        Geometry Frustum { 
            Radius 0.413319
            Height 0.5
            Taper 0.994245
            Solid False
        }
    }
}

Shape SHAPEID_757_201682552 { 
    Id  757
    ParentId  749
    Geometry  GEOMID_757_200052932
    Appearance  Color_3
}

Translated GEOMID_758_193822124 { 
    Translation <0.0247728,-0.0654487,18.2741>
    Geometry Oriented { 
        Primary <0.217119,-0.976145,0.00104341>
        Secondary <0.976105,0.21712,0.00882257>
        Geometry Cylinder { 
            Radius 0.410941
            Height 1.16847
            Solid False
        }
    }
}

Texture2D APPID_758_208071928 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <55.1681,0>
    }
}

Shape SHAPEID_758_192435288 { 
    Id  758
    ParentId  757
    Geometry  GEOMID_758_193822124
    Appearance  APPID_758_208071928
}

Translated GEOMID_760_192677172 { 
    Translation <0.369173,-0.270977,19.4776>
    Geometry Oriented { 
        Primary <0.498687,0.866767,0.00512527>
        Secondary <-0.140327,0.0748984,0.987268>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.584233
            Solid False
        }
    }
}

Texture2D APPID_760_193039408 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <55.1681,0>
    }
}

Shape SHAPEID_760_207207816 { 
    Id  760
    ParentId  758
    Geometry  GEOMID_760_192677172
    Appearance  APPID_760_193039408
}

Translated GEOMID_760_196631828 { 
    Translation <0.868895,-0.559037,19.5704>
    Geometry Oriented { 
        Primary <0.498687,0.866767,0.00512527>
        Secondary <-0.140327,0.0748984,0.987268>
        Geometry Scaled { 
            Scale <2.92116,2.92116,2.92116>
            Geometry leaf

        }
    }
}

Texture2D APPID_760_194654688 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <55.1681,0>
    }
}

Shape SHAPEID_760_195194824 { 
    Id  760
    ParentId  760
    Geometry  GEOMID_760_196631828
    Appearance  APPID_760_194654688
}

Translated GEOMID_764_208891188 { 
    Translation <0.369173,-0.270977,19.4776>
    Geometry Oriented { 
        Primary <0.29878,0.639698,0.708178>
        Secondary <-0.86321,0.497589,-0.0852853>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_764_194789496 { 
    Id  764
    ParentId  758
    Geometry  GEOMID_764_208891188
    Appearance  Default
}

Translated GEOMID_766_194543476 { 
    Translation <0.0144451,-0.0664968,19.4425>
    Geometry Oriented { 
        Primary <0.499368,0.866376,0.00493161>
        Secondary <-0.866369,0.499309,0.00973108>
        Geometry Cylinder { 
            Radius 0.410941
            Height 1.5
            Solid False
        }
    }
}

Texture2D APPID_766_163701088 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <57.5667,0>
    }
}

Shape SHAPEID_766_208680320 { 
    Id  766
    ParentId  758
    Geometry  GEOMID_766_194543476
    Appearance  APPID_766_163701088
}

Translated GEOMID_768_194573028 { 
    Translation <-0.0999761,0.310102,20.9787>
    Geometry Oriented { 
        Primary <-0.953349,-0.301855,0.00289964>
        Secondary <0.0516043,-0.153503,0.9868>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.75
            Solid False
        }
    }
}

Texture2D APPID_768_200255976 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <57.5667,0>
    }
}

Shape SHAPEID_768_200035992 { 
    Id  768
    ParentId  766
    Geometry  GEOMID_768_194573028
    Appearance  APPID_768_200255976
}

Translated GEOMID_768_208794780 { 
    Translation <-0.323045,1.01579,21.1002>
    Geometry Oriented { 
        Primary <-0.953349,-0.301855,0.00289964>
        Secondary <0.0516043,-0.153503,0.9868>
        Geometry Scaled { 
            Scale <3.75,3.75,3.75>
            Geometry leaf

        }
    }
}

Texture2D APPID_768_181361000 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <57.5667,0>
    }
}

Shape SHAPEID_768_194927992 { 
    Id  768
    ParentId  768
    Geometry  GEOMID_768_208794780
    Appearance  APPID_768_181361000
}

Translated GEOMID_772_200150044 { 
    Translation <-0.0999761,0.310102,20.9787>
    Geometry Oriented { 
        Primary <-0.653343,-0.272277,0.706405>
        Secondary <0.300223,-0.949764,-0.0884054>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_772_165707248 { 
    Id  772
    ParentId  766
    Geometry  GEOMID_772_200150044
    Appearance  Default
}

Translated GEOMID_774_195631764 { 
    Translation <0.0233977,-0.0801948,20.9424>
    Geometry Oriented { 
        Primary <-0.953484,-0.301432,0.00279134>
        Secondary <0.301444,-0.953461,0.00659939>
        Geometry Cylinder { 
            Radius 0.413319
            Height 1.5
            Solid False
        }
    }
}

Texture2D APPID_774_208649512 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <59.9653,0>
    }
}

Shape SHAPEID_774_192657408 { 
    Id  774
    ParentId  766
    Geometry  GEOMID_774_195631764
    Appearance  APPID_774_208649512
}

Translated GEOMID_776_208234988 { 
    Translation <-0.149355,-0.442871,22.4774>
    Geometry Oriented { 
        Primary <0.906788,-0.42158,0.00237017>
        Secondary <0.0647297,0.14478,0.987344>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.75
            Solid False
        }
    }
}

Texture2D APPID_776_199753160 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <59.9653,0>
    }
}

Shape SHAPEID_776_199855536 { 
    Id  776
    ParentId  774
    Geometry  GEOMID_776_208234988
    Appearance  APPID_776_199753160
}

Translated GEOMID_776_200285420 { 
    Translation <-0.461796,-1.11424,22.5964>
    Geometry Oriented { 
        Primary <0.906788,-0.42158,0.00237017>
        Secondary <0.0647297,0.14478,0.987344>
        Geometry Scaled { 
            Scale <3.75,3.75,3.75>
            Geometry leaf

        }
    }
}

Texture2D APPID_776_192708360 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <59.9653,0>
    }
}

Shape SHAPEID_776_194573736 { 
    Id  776
    ParentId  776
    Geometry  GEOMID_776_200285420
    Appearance  APPID_776_192708360
}

Translated GEOMID_780_196064908 { 
    Translation <-0.149355,-0.442871,22.4774>
    Geometry Oriented { 
        Primary <0.66492,-0.243102,0.706246>
        Secondary <0.420404,0.903361,-0.0848515>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_780_208644904 { 
    Id  780
    ParentId  774
    Geometry  GEOMID_780_196064908
    Appearance  Default
}

Translated GEOMID_782_194588252 { 
    Translation <0.0244059,-0.0694941,22.4424>
    Geometry Oriented { 
        Primary <0.906635,-0.421909,0.00228047>
        Secondary <0.421867,0.906601,0.0101665>
        Geometry Cylinder { 
            Radius 0.410941
            Height 1.5
            Solid False
        }
    }
}

Texture2D APPID_782_193851320 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <62.3639,0>
    }
}

Shape SHAPEID_782_192999560 { 
    Id  782
    ParentId  774
    Geometry  GEOMID_782_194588252
    Appearance  APPID_782_193851320
}

Translated GEOMID_784_192931156 { 
    Translation <0.39297,0.0750778,23.9781>
    Geometry Oriented { 
        Primary <-0.384159,0.923253,0.00511995>
        Secondary <-0.146346,-0.0663668,0.987005>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.75
            Solid False
        }
    }
}

Texture2D APPID_784_194757112 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <62.3639,0>
    }
}

Shape SHAPEID_784_199950056 { 
    Id  784
    ParentId  782
    Geometry  GEOMID_784_192931156
    Appearance  APPID_784_194757112
}

Translated GEOMID_784_199759516 { 
    Translation <1.07667,0.358891,24.0985>
    Geometry Oriented { 
        Primary <-0.384159,0.923253,0.00511995>
        Secondary <-0.146346,-0.0663668,0.987005>
        Geometry Scaled { 
            Scale <3.75,3.75,3.75>
            Geometry leaf

        }
    }
}

Texture2D APPID_784_195464576 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <62.3639,0>
    }
}

Shape SHAPEID_784_208120984 { 
    Id  784
    ParentId  784
    Geometry  GEOMID_784_199759516
    Appearance  APPID_784_195464576
}

Translated GEOMID_788_202173012 { 
    Translation <0.39297,0.0750778,23.9781>
    Geometry Oriented { 
        Primary <-0.326811,0.625965,0.708069>
        Secondary <-0.920082,-0.38194,-0.0870142>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_788_199532672 { 
    Id  788
    ParentId  782
    Geometry  GEOMID_788_202173012
    Appearance  Default
}

Translated GEOMID_790_201581260 { 
    Translation <0.0148707,-0.081877,23.9423>
    Geometry Oriented { 
        Primary <-0.383435,0.923555,0.00492773>
        Secondary <-0.923521,-0.383464,0.00799579>
        Geometry Cylinder { 
            Radius 0.408542
            Height 1.5
            Solid False
        }
    }
}

Texture2D APPID_790_172297608 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <64.7625,0>
    }
}

Shape SHAPEID_790_209528304 { 
    Id  790
    ParentId  782
    Geometry  GEOMID_790_201581260
    Appearance  APPID_790_172297608
}

Translated GEOMID_792_208199116 { 
    Translation <-0.353775,0.0547754,25.4779>
    Geometry Oriented { 
        Primary <-0.340972,-0.940072,0.00174584>
        Secondary <0.15173,-0.0532007,0.986989>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.75
            Solid False
        }
    }
}

Texture2D APPID_792_201099200 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <64.7625,0>
    }
}

Shape SHAPEID_792_198206280 { 
    Id  792
    ParentId  790
    Geometry  GEOMID_792_208199116
    Appearance  APPID_792_201099200
}

Translated GEOMID_792_201234660 { 
    Translation <-1.04959,0.307376,25.5984>
    Geometry Oriented { 
        Primary <-0.340972,-0.940072,0.00174584>
        Secondary <0.15173,-0.0532007,0.986989>
        Geometry Scaled { 
            Scale <3.75,3.75,3.75>
            Geometry leaf

        }
    }
}

Texture2D APPID_792_199099848 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <64.7625,0>
    }
}

Shape SHAPEID_792_193591616 { 
    Id  792
    ParentId  792
    Geometry  GEOMID_792_201234660
    Appearance  APPID_792_199099848
}

Translated GEOMID_796_200182820 { 
    Translation <-0.353775,0.0547754,25.4779>
    Geometry Oriented { 
        Primary <-0.18281,-0.684563,0.705659>
        Secondary <0.936396,-0.33994,-0.0871921>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_796_192688824 { 
    Id  796
    ParentId  790
    Geometry  GEOMID_796_200182820
    Appearance  Default
}

Translated GEOMID_798_203252028 { 
    Translation <0.0287819,-0.0841045,25.4422>
    Geometry Oriented { 
        Primary <-0.341224,-0.939981,0.00168034>
        Secondary <0.939958,-0.341201,0.00781736>
        Geometry Cylinder { 
            Radius 0.408542
            Height 1.5
            Solid False
        }
    }
}

Texture2D APPID_798_193580464 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <67.1611,0>
    }
}

Shape SHAPEID_798_195947816 { 
    Id  798
    ParentId  790
    Geometry  GEOMID_798_203252028
    Appearance  APPID_798_193580464
}

Translated GEOMID_800_192446876 { 
    Translation <0.206884,-0.438646,26.9769>
    Geometry Oriented { 
        Primary <0.886319,0.463058,0.00399132>
        Secondary <-0.0769836,0.138841,0.987318>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.75
            Solid False
        }
    }
}

Texture2D APPID_800_198970224 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <67.1611,0>
    }
}

Shape SHAPEID_800_198548384 { 
    Id  800
    ParentId  798
    Geometry  GEOMID_800_192446876
    Appearance  APPID_800_198970224
}

Translated GEOMID_800_196530180 { 
    Translation <0.549358,-1.09519,27.0959>
    Geometry Oriented { 
        Primary <0.886319,0.463058,0.00399132>
        Secondary <-0.0769836,0.138841,0.987318>
        Geometry Scaled { 
            Scale <3.75,3.75,3.75>
            Geometry leaf

        }
    }
}

Texture2D APPID_800_192624080 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <67.1611,0>
    }
}

Shape SHAPEID_800_192963536 { 
    Id  800
    ParentId  800
    Geometry  GEOMID_800_196530180
    Appearance  APPID_800_192624080
}

Translated GEOMID_804_196751956 { 
    Translation <0.206884,-0.438646,26.9769>
    Geometry Oriented { 
        Primary <0.596491,0.379206,0.707391>
        Secondary <-0.46082,0.883415,-0.0849911>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_804_193432256 { 
    Id  804
    ParentId  798
    Geometry  GEOMID_804_196751956
    Appearance  Default
}

Translated GEOMID_806_171719556 { 
    Translation <0.0186197,-0.0777341,26.9422>
    Geometry Oriented { 
        Primary <0.886602,0.462516,0.00384035>
        Secondary <-0.462531,0.886547,0.0100264>
        Geometry Cylinder { 
            Radius 0.410941
            Height 1.5
            Solid False
        }
    }
}

Texture2D APPID_806_195974736 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <69.5597,0>
    }
}

Shape SHAPEID_806_200390408 { 
    Id  806
    ParentId  798
    Geometry  GEOMID_806_171719556
    Appearance  APPID_806_195974736
}

Translated GEOMID_808_199597132 { 
    Translation <0.126073,0.301761,28.4782>
    Geometry Oriented { 
        Primary <-0.966307,0.257362,0.00389083>
        Secondary <-0.0378429,-0.157007,0.986872>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.75
            Solid False
        }
    }
}

Texture2D APPID_808_206452192 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <69.5597,0>
    }
}

Shape SHAPEID_808_199678824 { 
    Id  808
    ParentId  806
    Geometry  GEOMID_808_199597132
    Appearance  APPID_808_206452192
}

Translated GEOMID_808_201491348 { 
    Translation <0.317019,1.01687,28.5993>
    Geometry Oriented { 
        Primary <-0.966307,0.257362,0.00389083>
        Secondary <-0.0378429,-0.157007,0.986872>
        Geometry Scaled { 
            Scale <3.75,3.75,3.75>
            Geometry leaf

        }
    }
}

Texture2D APPID_808_208984856 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <69.5597,0>
    }
}

Shape SHAPEID_808_200859456 { 
    Id  808
    ParentId  808
    Geometry  GEOMID_808_201491348
    Appearance  APPID_808_208984856
}

Translated GEOMID_812_201050244 { 
    Translation <0.126073,0.301761,28.4782>
    Geometry Oriented { 
        Primary <-0.696573,0.121402,0.70714>
        Secondary <-0.256981,-0.96241,-0.0879138>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_812_194986952 { 
    Id  812
    ParentId  806
    Geometry  GEOMID_812_201050244
    Appearance  Default
}

Translated GEOMID_814_195558020 { 
    Translation <0.0204688,-0.0937327,28.4421>
    Geometry Oriented { 
        Primary <-0.966154,0.257938,0.00374524>
        Secondary <-0.257908,-0.966143,0.00709286>
        Geometry Cylinder { 
            Radius 0.408542
            Height 1.5
            Solid False
        }
    }
}

Texture2D APPID_814_194176880 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <71.9583,0>
    }
}

Shape SHAPEID_814_178525120 { 
    Id  814
    ParentId  806
    Geometry  GEOMID_814_195558020
    Appearance  APPID_814_194176880
}

Translated GEOMID_816_196473276 { 
    Translation <-0.314449,-0.303916,29.9771>
    Geometry Oriented { 
        Primary <0.538343,-0.842723,0.00200466>
        Secondary <0.133326,0.0875188,0.9872>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.75
            Solid False
        }
    }
}

Texture2D APPID_816_200442360 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <71.9583,0>
    }
}

Shape SHAPEID_816_200901744 { 
    Id  816
    ParentId  814
    Geometry  GEOMID_816_196473276
    Appearance  APPID_816_200442360
}

Translated GEOMID_816_194011708 { 
    Translation <-0.938533,-0.702305,30.0967>
    Geometry Oriented { 
        Primary <0.538343,-0.842723,0.00200466>
        Secondary <0.133326,0.0875188,0.9872>
        Geometry Scaled { 
            Scale <3.75,3.75,3.75>
            Geometry leaf

        }
    }
}

Texture2D APPID_816_193777536 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <71.9583,0>
    }
}

Shape SHAPEID_816_194461952 { 
    Id  816
    ParentId  816
    Geometry  GEOMID_816_194011708
    Appearance  APPID_816_193777536
}

Translated GEOMID_820_199771404 { 
    Translation <-0.314449,-0.303916,29.9771>
    Geometry Oriented { 
        Primary <0.430946,-0.562095,0.705928>
        Secondary <0.839791,0.536087,-0.0858059>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_820_199743352 { 
    Id  820
    ParentId  814
    Geometry  GEOMID_820_199771404
    Appearance  Default
}

Translated GEOMID_822_201569236 { 
    Translation <0.0286407,-0.0849024,29.942>
    Geometry Oriented { 
        Primary <0.538085,-0.842889,0.00192906>
        Secondary <0.842845,0.538078,0.00920872>
        Geometry Cylinder { 
            Radius 0.406121
            Height 1.16971
            Solid False
        }
    }
}

Texture2D APPID_822_203215968 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <74.3569,0>
    }
}

Shape SHAPEID_822_193420968 { 
    Id  822
    ParentId  814
    Geometry  GEOMID_822_201569236
    Appearance  APPID_822_203215968
}

Translated GEOMID_824_195087036 { 
    Translation <0.416878,-0.15869,31.1467>
    Geometry Oriented { 
        Primary <0.171983,0.985088,0.00473758>
        Secondary <-0.158194,0.0228711,0.987143>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.584854
            Solid False
        }
    }
}

Texture2D APPID_824_192815800 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <74.3569,0>
    }
}

Shape SHAPEID_824_202266984 { 
    Id  824
    ParentId  822
    Geometry  GEOMID_824_195087036
    Appearance  APPID_824_192815800
}

Translated GEOMID_824_209785092 { 
    Translation <0.98554,-0.25842,31.2401>
    Geometry Oriented { 
        Primary <0.171983,0.985088,0.00473758>
        Secondary <-0.158194,0.0228711,0.987143>
        Geometry Scaled { 
            Scale <2.92427,2.92427,2.92427>
            Geometry leaf

        }
    }
}

Texture2D APPID_824_194761144 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <74.3569,0>
    }
}

Shape SHAPEID_824_200761888 { 
    Id  824
    ParentId  824
    Geometry  GEOMID_824_209785092
    Appearance  APPID_824_194761144
}

Translated GEOMID_828_194988772 { 
    Translation <0.416878,-0.15869,31.1467>
    Geometry Oriented { 
        Primary <0.0612898,0.703696,0.707852>
        Secondary <-0.981308,0.172099,-0.0861211>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_828_208156656 { 
    Id  828
    ParentId  822
    Geometry  GEOMID_828_194988772
    Appearance  Default
}

Translated GEOMID_830_192518452 { 
    Translation <0.0183474,-0.0887966,31.1117>
    Geometry Oriented { 
        Primary <0.172698,0.984964,0.00455912>
        Secondary <-0.984943,0.172653,0.00889224>
        Geometry Cylinder { 
            Radius 0.406121
            Height 1.48499
            Solid False
        }
    }
}

Texture2D APPID_830_193755424 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <76.7556,0>
    }
}

Shape SHAPEID_830_194098208 { 
    Id  830
    ParentId  822
    Geometry  GEOMID_830_192518452
    Appearance  APPID_830_193755424
}

Translated GEOMID_832_194624148 { 
    Translation <-0.216407,0.222975,32.6322>
    Geometry Oriented { 
        Primary <-0.7925,-0.609867,0.00261171>
        Secondary <0.10032,-0.126135,0.986927>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.742494
            Solid False
        }
    }
}

Texture2D APPID_832_171943624 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <76.7556,0>
    }
}

Shape SHAPEID_832_194755584 { 
    Id  832
    ParentId  830
    Geometry  GEOMID_832_194624148
    Appearance  APPID_832_171943624
}

Translated GEOMID_832_208569292 { 
    Translation <-0.663066,0.803904,32.7518>
    Geometry Oriented { 
        Primary <-0.7925,-0.609867,0.00261171>
        Secondary <0.10032,-0.126135,0.986927>
        Geometry Scaled { 
            Scale <3.71247,3.71247,3.71247>
            Geometry leaf

        }
    }
}

Texture2D APPID_832_169988600 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <76.7556,0>
    }
}

Shape SHAPEID_832_193506936 { 
    Id  832
    ParentId  832
    Geometry  GEOMID_832_208569292
    Appearance  APPID_832_169988600
}

Translated GEOMID_836_195953284 { 
    Translation <-0.216407,0.222975,32.6322>
    Geometry Oriented { 
        Primary <-0.521234,-0.479087,0.706251>
        Secondary <0.607189,-0.789716,-0.0875819>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_836_194102792 { 
    Id  836
    ParentId  830
    Geometry  GEOMID_836_195953284
    Appearance  Default
}

Translated GEOMID_838_193841980 { 
    Translation <0.0301848,-0.0977454,32.5966>
    Geometry Oriented { 
        Primary <-0.792744,-0.60955,0.00251387>
        Secondary <0.60955,-0.792713,0.00742602>
        Geometry Cylinder { 
            Radius 0.410941
            Height 1.5
            Solid False
        }
    }
}

Texture2D APPID_838_195415288 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <79.1542,0>
    }
}

Shape SHAPEID_838_197096896 { 
    Id  838
    ParentId  830
    Geometry  GEOMID_838_193841980
    Appearance  APPID_838_195415288
}

Translated GEOMID_840_194785372 { 
    Translation <-0.00889557,-0.494539,34.1316>
    Geometry Oriented { 
        Primary <0.996319,-0.0856634,0.00312339>
        Secondary <0.010544,0.15863,0.987282>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.75
            Solid False
        }
    }
}

Texture2D APPID_840_196288408 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <79.1542,0>
    }
}

Shape SHAPEID_840_200025248 { 
    Id  840
    ParentId  838
    Geometry  GEOMID_840_194785372
    Appearance  APPID_840_196288408
}

Translated GEOMID_840_196356196 { 
    Translation <-0.0726976,-1.23225,34.2508>
    Geometry Oriented { 
        Primary <0.996319,-0.0856634,0.00312339>
        Secondary <0.010544,0.15863,0.987282>
        Geometry Scaled { 
            Scale <3.75,3.75,3.75>
            Geometry leaf

        }
    }
}

Texture2D APPID_840_199966600 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <79.1542,0>
    }
}

Shape SHAPEID_840_195057352 { 
    Id  840
    ParentId  840
    Geometry  GEOMID_840_196356196
    Appearance  APPID_840_199966600
}

Translated GEOMID_844_193554468 { 
    Translation <-0.00889557,-0.494539,34.1316>
    Geometry Oriented { 
        Primary <0.707455,-0.000487646,0.706758>
        Secondary <0.0858512,0.992654,-0.085251>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_844_196356264 { 
    Id  844
    ParentId  838
    Geometry  GEOMID_844_193554468
    Appearance  Default
}

Translated GEOMID_846_180666140 { 
    Translation <0.0263842,-0.0866165,34.0966>
    Geometry Oriented { 
        Primary <0.996278,-0.0861403,0.00300536>
        Secondary <0.0861073,0.996238,0.00976562>
        Geometry Cylinder { 
            Radius 0.408542
            Height 1.5
            Solid False
        }
    }
}

Texture2D APPID_846_196119688 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <81.5528,0>
    }
}

Shape SHAPEID_846_193554536 { 
    Id  846
    ParentId  838
    Geometry  GEOMID_846_180666140
    Appearance  APPID_846_196119688
}

Translated GEOMID_848_192576676 { 
    Translation <0.320414,0.174437,35.6321>
    Geometry Oriented { 
        Primary <-0.676849,0.736109,0.00432495>
        Secondary <-0.115466,-0.11197,0.98698>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.75
            Solid False
        }
    }
}

Texture2D APPID_848_196099672 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <81.5528,0>
    }
}

Shape SHAPEID_848_194077032 { 
    Id  848
    ParentId  846
    Geometry  GEOMID_848_192576676
    Appearance  APPID_848_196099672
}

Translated GEOMID_848_208451356 { 
    Translation <0.865671,0.675091,35.7527>
    Geometry Oriented { 
        Primary <-0.676849,0.736109,0.00432495>
        Secondary <-0.115466,-0.11197,0.98698>
        Geometry Scaled { 
            Scale <3.75,3.75,3.75>
            Geometry leaf

        }
    }
}

Texture2D APPID_848_194883888 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <81.5528,0>
    }
}

Shape SHAPEID_848_200265632 { 
    Id  848
    ParentId  848
    Geometry  GEOMID_848_208451356
    Appearance  APPID_848_194883888
}

Translated GEOMID_852_208091932 { 
    Translation <0.320414,0.174437,35.6321>
    Geometry Oriented { 
        Primary <-0.521758,0.476678,0.707493>
        Secondary <-0.733787,-0.673761,-0.0871979>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_852_208451424 { 
    Id  852
    ParentId  846
    Geometry  GEOMID_852_208091932
    Appearance  Default
}

Translated GEOMID_854_195645828 { 
    Translation <0.0206313,-0.100822,35.5965>
    Geometry Oriented { 
        Primary <-0.676362,0.736557,0.00416269>
        Secondary <-0.736519,-0.676371,0.00781142>
        Geometry Cylinder { 
            Radius 0.406121
            Height 1.5
            Solid False
        }
    }
}

Texture2D APPID_854_199596992 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <83.9514,0>
    }
}

Shape SHAPEID_854_208092000 { 
    Id  854
    ParentId  846
    Geometry  GEOMID_854_195645828
    Appearance  APPID_854_199596992
}

Translated GEOMID_856_193709036 { 
    Translation <-0.371111,-0.0979259,37.1316>
    Geometry Oriented { 
        Primary <0.00141612,-0.999997,0.00217982>
        Secondary <0.160192,0.00237853,0.987083>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.75
            Solid False
        }
    }
}

Texture2D APPID_856_208434024 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <83.9514,0>
    }
}

Shape SHAPEID_856_199702984 { 
    Id  856
    ParentId  854
    Geometry  GEOMID_856_193709036
    Appearance  APPID_856_208434024
}

Translated GEOMID_856_196128724 { 
    Translation <-1.11143,-0.0987123,37.2517>
    Geometry Oriented { 
        Primary <0.00141612,-0.999997,0.00217982>
        Secondary <0.160192,0.00237853,0.987083>
        Geometry Scaled { 
            Scale <3.75,3.75,3.75>
            Geometry leaf

        }
    }
}

Texture2D APPID_856_209029448 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <83.9514,0>
    }
}

Shape SHAPEID_856_178522352 { 
    Id  856
    ParentId  856
    Geometry  GEOMID_856_196128724
    Appearance  APPID_856_209029448
}

Translated GEOMID_860_200142492 { 
    Translation <0.0334849,-0.097496,37.0964>
    Geometry Oriented { 
        Primary <0.00661948,-0.732889,0.680316>
        Secondary <0.999965,0.00139316,-0.00822885>
        Geometry Cylinder { 
            Radius 0.160201
            Solid False
        }
    }
}

Shape SHAPEID_860_196128792 { 
    Id  860
    ParentId  854
    Geometry  GEOMID_860_200142492
    Appearance  APPID_6_201601160
}

Translated GEOMID_861_201763236 { 
    Translation <0.038568,0.58285,37.8293>
    Geometry Oriented { 
        Primary <0.0064332,-0.757823,0.652429>
        Secondary <0.999967,0.00169475,-0.00789154>
        Geometry Cylinder { 
            Radius 0.160201
            Height 0.5
            Solid False
        }
    }
}

Shape SHAPEID_861_193610048 { 
    Id  861
    ParentId  860
    Geometry  GEOMID_861_201763236
    Appearance  Color_3
}

Translated GEOMID_862_193364188 { 
    Translation <0.0410053,0.909079,38.2082>
    Geometry Oriented { 
        Primary <0.00687089,-0.780523,0.62509>
        Secondary <0.999904,0.0128958,0.00511168>
        Geometry Cylinder { 
            Radius 0.160201
            Height 0.284369
            Solid False
        }
    }
}

Shape SHAPEID_862_201763304 { 
    Id  862
    ParentId  861
    Geometry  GEOMID_862_193364188
    Appearance  APPID_3_195328248
}

Translated GEOMID_864_192729772 { 
    Translation <0.153071,1.0062,38.5065>
    Geometry Oriented { 
        Primary <0.710652,0.55612,-0.430935>
        Secondary <-0.0806355,0.672866,0.735357>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.142184
            Solid False
        }
    }
}

Shape SHAPEID_864_193364256 { 
    Id  864
    ParentId  862
    Geometry  GEOMID_864_192729772
    Appearance  APPID_5_196508344
}

Translated GEOMID_864_193431276 { 
    Translation <0.252445,0.936833,38.5809>
    Geometry Oriented { 
        Primary <0.710652,0.55612,-0.430935>
        Secondary <-0.0806355,0.672866,0.735357>
        Geometry Scaled { 
            Scale <0.710922,0.710922,0.710922>
            Geometry leaf

        }
    }
}

Shape SHAPEID_864_192729800 { 
    Id  864
    ParentId  864
    Geometry  GEOMID_864_193431276
    Appearance  APPID_5_196508344
}

Translated GEOMID_868_200868564 { 
    Translation <0.153071,1.0062,38.5065>
    Geometry Oriented { 
        Primary <0.45512,0.862302,0.222039>
        Secondary <-0.720922,0.5032,-0.476509>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_868_195087320 { 
    Id  868
    ParentId  862
    Geometry  GEOMID_868_200868564
    Appearance  Default
}

Translated GEOMID_870_195126244 { 
    Translation <0.0375784,1.08681,38.4302>
    Geometry Oriented { 
        Primary <0.670481,0.599023,-0.437751>
        Secondary <-0.741926,0.542022,-0.394661>
        Geometry Cylinder { 
            Radius 0.15
            Height 0.389844
            Solid False
        }
    }
}

Texture2D APPID_870_193074392 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_870_193431344 { 
    Id  870
    ParentId  862
    Geometry  GEOMID_870_195126244
    Appearance  APPID_870_193074392
}

Translated GEOMID_872_194012796 { 
    Translation <0.0227726,1.44609,38.6709>
    Geometry Oriented { 
        Primary <-0.994075,-0.088237,0.0634767>
        Secondary <0.0223622,0.40547,0.913835>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.194922
            Solid False
        }
    }
}

Texture2D APPID_872_208565016 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_872_200868632 { 
    Id  872
    ParentId  870
    Geometry  GEOMID_872_194012796
    Appearance  APPID_872_208565016
}

Translated GEOMID_872_196665996 { 
    Translation <0.00203832,1.62343,38.5928>
    Geometry Oriented { 
        Primary <-0.994075,-0.088237,0.0634767>
        Secondary <0.0223622,0.40547,0.913835>
        Geometry Scaled { 
            Scale <0.97461,0.97461,0.97461>
            Geometry leaf

        }
    }
}

Texture2D APPID_872_194840640 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_872_199563632 { 
    Id  872
    ParentId  872
    Geometry  GEOMID_872_196665996
    Appearance  APPID_872_194840640
}

Translated GEOMID_876_208180068 { 
    Translation <0.0227726,1.44609,38.6709>
    Geometry Oriented { 
        Primary <-0.695276,0.294207,0.65577>
        Secondary <0.100939,-0.863373,0.494367>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_876_196666064 { 
    Id  876
    ParentId  870
    Geometry  GEOMID_876_208180068
    Appearance  Default
}

Translated GEOMID_878_207114316 { 
    Translation <0.0227726,1.44609,38.6709>
    Geometry Oriented { 
        Primary <-0.994825,-0.0818175,0.0602349>
        Secondary <0.100939,-0.863373,0.494367>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_878_208180136 { 
    Id  878
    ParentId  870
    Geometry  GEOMID_878_207114316
    Appearance  Default
}

Translated GEOMID_880_192703596 { 
    Translation <0.0334849,-0.097496,37.0964>
    Geometry Oriented { 
        Primary <0.00108224,-0.999997,0.00209785>
        Secondary <0.999964,0.0010999,0.0084375>
        Geometry Cylinder { 
            Radius 0.389531
            Height 1.5
            Solid False
        }
    }
}

Texture2D APPID_880_196152760 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <86.35,0>
    }
}

Shape SHAPEID_880_192703520 { 
    Id  880
    ParentId  854
    Geometry  GEOMID_880_192703596
    Appearance  APPID_880_196152760
}

Translated GEOMID_882_199081764 { 
    Translation <0.307243,-0.356251,38.6298>
    Geometry Oriented { 
        Primary <0.674303,0.738444,0.00410063>
        Secondary <-0.120413,0.104472,0.987211>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.75
            Solid False
        }
    }
}

Texture2D APPID_882_193914048 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <86.35,0>
    }
}

Shape SHAPEID_882_201321848 { 
    Id  882
    ParentId  880
    Geometry  GEOMID_882_199081764
    Appearance  APPID_882_193914048
}

Translated GEOMID_882_194765180 { 
    Translation <0.853672,-0.855881,38.7493>
    Geometry Oriented { 
        Primary <0.674303,0.738444,0.00410063>
        Secondary <-0.120413,0.104472,0.987211>
        Geometry Scaled { 
            Scale <3.75,3.75,3.75>
            Geometry leaf

        }
    }
}

Texture2D APPID_882_193883216 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <86.35,0>
    }
}

Shape SHAPEID_882_193971888 { 
    Id  882
    ParentId  882
    Geometry  GEOMID_882_194765180
    Appearance  APPID_882_193883216
}

Translated GEOMID_886_196522708 { 
    Translation <0.0208253,-0.0943631,38.5964>
    Geometry Oriented { 
        Primary <0.489858,0.54347,0.681674>
        Secondary <-0.738183,0.674561,-0.00733316>
        Geometry Cylinder { 
            Radius 0.252854
            Solid False
        }
    }
}

Shape SHAPEID_886_208486376 { 
    Id  886
    ParentId  880
    Geometry  GEOMID_886_196522708
    Appearance  APPID_6_201601160
}

Translated GEOMID_887_193830596 { 
    Translation <-0.442991,-0.593971,39.328>
    Geometry Oriented { 
        Primary <0.506898,0.561826,0.653763>
        Secondary <-0.738366,0.674363,-0.00703291>
        Geometry Cylinder { 
            Radius 0.252854
            Height 0.5
            Solid False
        }
    }
}

Shape SHAPEID_887_208486416 { 
    Id  887
    ParentId  886
    Geometry  GEOMID_887_193830596
    Appearance  Color_3
}

Translated GEOMID_888_208153236 { 
    Translation <-0.665403,-0.833547,39.7063>
    Geometry Oriented { 
        Primary <0.521965,0.578949,0.626395>
        Secondary <-0.745875,0.66606,0.00591537>
        Geometry Cylinder { 
            Radius 0.252854
            Height 0.890098
            Solid False
        }
    }
}

Shape SHAPEID_888_192702200 { 
    Id  888
    ParentId  887
    Geometry  GEOMID_888_208153236
    Appearance  APPID_3_195328248
}

Translated GEOMID_890_172044268 { 
    Translation <-1.08219,-1.0354,40.521>
    Geometry Oriented { 
        Primary <-0.899429,0.0709422,-0.431272>
        Secondary <-0.395591,-0.55169,0.734265>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.445049
            Solid False
        }
    }
}

Shape SHAPEID_890_193047456 { 
    Id  890
    ParentId  888
    Geometry  GEOMID_890_172044268
    Appearance  APPID_5_196508344
}

Translated GEOMID_890_209636572 { 
    Translation <-1.1649,-0.665552,40.7543>
    Geometry Oriented { 
        Primary <-0.899429,0.0709422,-0.431272>
        Secondary <-0.395591,-0.55169,0.734265>
        Geometry Scaled { 
            Scale <2.22524,2.22524,2.22524>
            Geometry leaf

        }
    }
}

Shape SHAPEID_890_172044296 { 
    Id  890
    ParentId  890
    Geometry  GEOMID_890_209636572
    Appearance  APPID_5_196508344
}

Translated GEOMID_894_200243844 { 
    Translation <-1.08219,-1.0354,40.521>
    Geometry Oriented { 
        Primary <-0.918265,-0.328548,0.221011>
        Secondary <0.191704,-0.857257,-0.477871>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_894_193047408 { 
    Id  894
    ParentId  888
    Geometry  GEOMID_894_200243844
    Appearance  Default
}

Translated GEOMID_896_194149156 { 
    Translation <-1.03372,-1.25216,40.4001>
    Geometry Oriented { 
        Primary <-0.89881,0.0121564,-0.438169>
        Secondary <0.180926,-0.900204,-0.396105>
        Geometry Cylinder { 
            Radius 0.247855
            Height 0.354499
            Solid False
        }
    }
}

Texture2D APPID_896_171719584 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_896_177284544 { 
    Id  896
    ParentId  888
    Geometry  GEOMID_896_194149156
    Appearance  APPID_896_171719584
}

Translated GEOMID_898_201776532 { 
    Translation <-1.30136,-1.58092,40.5633>
    Geometry Oriented { 
        Primary <0.792358,-0.60682,0.0627568>
        Secondary <-0.290786,-0.285244,0.913279>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.177249
            Solid False
        }
    }
}

Texture2D APPID_898_199565408 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_898_197867872 { 
    Id  898
    ParentId  896
    Geometry  GEOMID_898_201776532
    Appearance  APPID_898_199565408
}

Translated GEOMID_898_193935500 { 
    Translation <-1.39642,-1.71242,40.492>
    Geometry Oriented { 
        Primary <0.792358,-0.60682,0.0627568>
        Secondary <-0.290786,-0.285244,0.913279>
        Geometry Scaled { 
            Scale <0.886247,0.886247,0.886247>
            Geometry leaf

        }
    }
}

Texture2D APPID_898_192521496 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_898_197867816 { 
    Id  898
    ParentId  898
    Geometry  GEOMID_898_193935500
    Appearance  APPID_898_192521496
}

Translated GEOMID_902_196426012 { 
    Translation <-1.30136,-1.58092,40.5633>
    Geometry Oriented { 
        Primary <0.313469,-0.687773,0.654756>
        Secondary <0.508783,0.703833,0.495741>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_902_201180192 { 
    Id  902
    ParentId  896
    Geometry  GEOMID_902_196426012
    Appearance  Default
}

Translated GEOMID_904_200285060 { 
    Translation <-1.17525,-1.40647,40.6862>
    Geometry Oriented { 
        Primary <0.786091,-0.61583,0.0530475>
        Secondary <0.479683,0.661918,0.575993>
        Geometry Cylinder { 
            Radius 0.242702
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_904_199164360 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_904_207067208 { 
    Id  904
    ParentId  896
    Geometry  GEOMID_904_200285060
    Appearance  APPID_904_199164360
}

Translated GEOMID_906_192466868 { 
    Translation <-1.54582,-2.02412,42.0209>
    Geometry Oriented { 
        Primary <-0.291555,0.89829,0.328741>
        Secondary <-0.473858,-0.434173,0.766129>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_906_194121952 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_906_201060304 { 
    Id  906
    ParentId  904
    Geometry  GEOMID_906_192466868
    Appearance  APPID_906_194121952
}

Translated GEOMID_906_193501076 { 
    Translation <-0.928853,-1.97394,42.431>
    Geometry Oriented { 
        Primary <-0.291555,0.89829,0.328741>
        Secondary <-0.473858,-0.434173,0.766129>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_906_198967160 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_906_194136792 { 
    Id  906
    ParentId  906
    Geometry  GEOMID_906_193501076
    Appearance  APPID_906_198967160
}

Translated GEOMID_910_195945676 { 
    Translation <-1.54582,-2.02412,42.0209>
    Geometry Oriented { 
        Primary <-0.500525,0.331492,0.799742>
        Secondary <-0.858362,-0.0698232,-0.508271>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_910_195945704 { 
    Id  910
    ParentId  904
    Geometry  GEOMID_910_195945676
    Appearance  Default
}

Translated GEOMID_912_201060228 { 
    Translation <-1.75415,-2.04107,41.8976>
    Geometry Oriented { 
        Primary <-0.248686,0.908976,0.334541>
        Secondary <-0.900087,-0.0892986,-0.426461>
        Geometry Cylinder { 
            Radius 0.23738
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_912_193592152 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_912_201575512 { 
    Id  912
    ParentId  904
    Geometry  GEOMID_912_201060228
    Appearance  APPID_912_193592152
}

Translated GEOMID_914_208929868 { 
    Translation <-2.48362,-2.51506,43.1442>
    Geometry Oriented { 
        Primary <-0.497174,-0.682744,-0.535424>
        Secondary <-0.24394,-0.482214,0.841405>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_914_194574176 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_914_208059680 { 
    Id  914
    ParentId  912
    Geometry  GEOMID_914_208929868
    Appearance  APPID_914_194574176
}

Translated GEOMID_914_194098900 { 
    Translation <-3.10186,-2.10748,43.1985>
    Geometry Oriented { 
        Primary <-0.497174,-0.682744,-0.535424>
        Secondary <-0.24394,-0.482214,0.841405>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_914_200840352 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_914_208059624 { 
    Id  914
    ParentId  914
    Geometry  GEOMID_914_194098900
    Appearance  APPID_914_200840352
}

Translated GEOMID_918_193623228 { 
    Translation <-2.48362,-2.51506,43.1442>
    Geometry Oriented { 
        Primary <-0.538311,-0.814346,0.21694>
        Secondary <0.83488,-0.550404,0.00555666>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_918_194562528 { 
    Id  918
    ParentId  912
    Geometry  GEOMID_918_193623228
    Appearance  Default
}

Translated GEOMID_920_196582060 { 
    Translation <-2.28543,-2.64572,43.1455>
    Geometry Oriented { 
        Primary <-0.43503,-0.741487,-0.51083>
        Secondary <0.827236,-0.553162,0.0984476>
        Geometry Cylinder { 
            Radius 0.23738
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_920_209608736 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <9.59444,0>
    }
}

Shape SHAPEID_920_206338072 { 
    Id  920
    ParentId  912
    Geometry  GEOMID_920_196582060
    Appearance  APPID_920_209608736
}

Translated GEOMID_922_193667684 { 
    Translation <-2.7368,-3.43008,44.3704>
    Geometry Oriented { 
        Primary <0.852879,0.249847,0.458448>
        Secondary <-0.407088,-0.231589,0.883542>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_922_199230936 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <9.59444,0>
    }
}

Shape SHAPEID_922_196145288 { 
    Id  922
    ParentId  920
    Geometry  GEOMID_922_193667684
    Appearance  APPID_922_199230936
}

Translated GEOMID_922_208516196 { 
    Translation <-2.49406,-4.12817,44.2992>
    Geometry Oriented { 
        Primary <0.852879,0.249847,0.458448>
        Secondary <-0.407088,-0.231589,0.883542>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_922_169147416 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <9.59444,0>
    }
}

Shape SHAPEID_922_199702560 { 
    Id  922
    ParentId  922
    Geometry  GEOMID_922_208516196
    Appearance  APPID_922_169147416
}

Translated GEOMID_926_178499740 { 
    Translation <-2.7368,-3.43008,44.3704>
    Geometry Oriented { 
        Primary <0.342411,-0.0652834,0.937279>
        Secondary <-0.322908,0.928639,0.182648>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_926_209029368 { 
    Id  926
    ParentId  920
    Geometry  GEOMID_926_178499740
    Appearance  Default
}

Translated GEOMID_928_201749076 { 
    Translation <-2.81345,-3.20964,44.4137>
    Geometry Oriented { 
        Primary <0.887596,0.181996,0.423143>
        Secondary <-0.316979,0.907863,0.274427>
        Geometry Cylinder { 
            Radius 0.231874
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_928_194774584 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <11.9931,0>
    }
}

Shape SHAPEID_928_201180640 { 
    Id  928
    ParentId  920
    Geometry  GEOMID_928_201749076
    Appearance  APPID_928_194774584
}

Translated GEOMID_930_192770836 { 
    Translation <-3.22754,-3.59253,45.8198>
    Geometry Oriented { 
        Primary <-0.863232,0.490681,-0.118587>
        Secondary <-0.37051,-0.456297,0.809021>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_930_169210320 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <11.9931,0>
    }
}

Shape SHAPEID_930_201180680 { 
    Id  930
    ParentId  928
    Geometry  GEOMID_930_192770836
    Appearance  APPID_930_169210320
}

Translated GEOMID_930_200864844 { 
    Translation <-2.97297,-3.04137,46.2473>
    Geometry Oriented { 
        Primary <-0.863232,0.490681,-0.118587>
        Secondary <-0.37051,-0.456297,0.809021>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_930_201569080 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <11.9931,0>
    }
}

Shape SHAPEID_930_194156048 { 
    Id  930
    ParentId  930
    Geometry  GEOMID_930_200864844
    Appearance  APPID_930_201569080
}

Translated GEOMID_934_200198252 { 
    Translation <-3.22754,-3.59253,45.8198>
    Geometry Oriented { 
        Primary <-0.861894,0.0470319,0.504903>
        Secondary <-0.354583,-0.767691,-0.53378>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_934_209588456 { 
    Id  934
    ParentId  928
    Geometry  GEOMID_934_200198252
    Appearance  Default
}

Translated GEOMID_936_191637964 { 
    Translation <-3.30976,-3.77054,45.696>
    Geometry Oriented { 
        Primary <-0.870671,0.47681,-0.120766>
        Secondary <-0.379644,-0.807559,-0.451352>
        Geometry Cylinder { 
            Radius 0.226166
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_936_195373344 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <14.3917,0>
    }
}

Shape SHAPEID_936_192509672 { 
    Id  936
    ParentId  928
    Geometry  GEOMID_936_191637964
    Appearance  APPID_936_195373344
}

Translated GEOMID_938_206337012 { 
    Translation <-3.97845,-4.35033,46.9363>
    Geometry Oriented { 
        Primary <0.343805,-0.910227,-0.230834>
        Secondary <-0.14222,-0.293456,0.945334>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_938_195474608 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <14.3917,0>
    }
}

Shape SHAPEID_938_192509712 { 
    Id  938
    ParentId  936
    Geometry  GEOMID_938_206337012
    Appearance  APPID_938_195474608
}

Translated GEOMID_938_207053140 { 
    Translation <-4.66764,-4.56728,46.7652>
    Geometry Oriented { 
        Primary <0.343805,-0.910227,-0.230834>
        Secondary <-0.14222,-0.293456,0.945334>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_938_201118968 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <14.3917,0>
    }
}

Shape SHAPEID_938_209028904 { 
    Id  938
    ParentId  938
    Geometry  GEOMID_938_207053140
    Appearance  APPID_938_201118968
}

Translated GEOMID_942_193948820 { 
    Translation <-3.97845,-4.35033,46.9363>
    Geometry Oriented { 
        Primary <0.0973872,-0.865346,0.491621>
        Secondary <0.90321,0.284313,0.321523>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_942_192659880 { 
    Id  942
    ParentId  936
    Geometry  GEOMID_942_193948820
    Appearance  Default
}

Translated GEOMID_944_197281228 { 
    Translation <-3.77417,-4.28603,47.009>
    Geometry Oriented { 
        Primary <0.381835,-0.900992,-0.20595>
        Secondary <0.869709,0.274872,0.409942>
        Geometry Cylinder { 
            Radius 0.220234
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_944_194180112 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <16.7903,0>
    }
}

Shape SHAPEID_944_196050664 { 
    Id  944
    ParentId  936
    Geometry  GEOMID_944_197281228
    Appearance  APPID_944_194180112
}

Translated GEOMID_946_196509076 { 
    Translation <-4.04336,-4.87263,48.3796>
    Geometry Oriented { 
        Primary <0.253214,0.87384,0.415073>
        Secondary <-0.422228,-0.286207,0.860122>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_946_209113664 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <16.7903,0>
    }
}

Shape SHAPEID_946_194105136 { 
    Id  946
    ParentId  944
    Geometry  GEOMID_946_196509076
    Appearance  APPID_946_209113664
}

Translated GEOMID_946_196574300 { 
    Translation <-3.39708,-5.16447,48.5997>
    Geometry Oriented { 
        Primary <0.253214,0.87384,0.415073>
        Secondary <-0.422228,-0.286207,0.860122>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_946_193918696 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <16.7903,0>
    }
}

Shape SHAPEID_946_199732776 { 
    Id  946
    ParentId  946
    Geometry  GEOMID_946_196574300
    Appearance  APPID_946_193918696
}

Translated GEOMID_950_208307068 { 
    Translation <-4.04336,-4.87263,48.3796>
    Geometry Oriented { 
        Primary <-0.0640611,0.39048,0.91838>
        Secondary <-0.886508,0.400322,-0.232048>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_950_192651896 { 
    Id  950
    ParentId  944
    Geometry  GEOMID_950_208307068
    Appearance  Default
}

Translated GEOMID_952_194547764 { 
    Translation <-4.2386,-4.78447,48.3285>
    Geometry Oriented { 
        Primary <0.312504,0.85743,0.408845>
        Secondary <-0.906723,0.397561,-0.140705>
        Geometry Cylinder { 
            Radius 0.220234
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_952_196669904 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <19.1889,0>
    }
}

Shape SHAPEID_952_193759296 { 
    Id  952
    ParentId  944
    Geometry  GEOMID_952_194547764
    Appearance  APPID_952_196669904
}

Translated GEOMID_954_203215516 { 
    Translation <-4.75838,-5.08036,49.7205>
    Geometry Oriented { 
        Primary <-0.867684,-0.316448,-0.383386>
        Secondary <-0.226994,-0.433916,0.871889>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_954_195357896 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <19.1889,0>
    }
}

Shape SHAPEID_954_193759392 { 
    Id  954
    ParentId  952
    Geometry  GEOMID_954_203215516
    Appearance  APPID_954_195357896
}

Translated GEOMID_954_197872076 { 
    Translation <-5.08676,-4.45403,49.9467>
    Geometry Oriented { 
        Primary <-0.867684,-0.316448,-0.383386>
        Secondary <-0.226994,-0.433916,0.871889>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_954_208206912 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <19.1889,0>
    }
}

Shape SHAPEID_954_202161856 { 
    Id  954
    ParentId  954
    Geometry  GEOMID_954_197872076
    Appearance  APPID_954_208206912
}

Translated GEOMID_958_195232644 { 
    Translation <-4.75838,-5.08036,49.7205>
    Geometry Oriented { 
        Primary <-0.784806,-0.51008,0.351992>
        Secondary <0.450675,-0.859591,-0.240823>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_958_193742344 { 
    Id  958
    ParentId  952
    Geometry  GEOMID_958_195232644
    Appearance  Default
}

Translated GEOMID_960_195926612 { 
    Translation <-4.65913,-5.26967,49.6675>
    Geometry Oriented { 
        Primary <-0.848798,-0.369805,-0.377871>
        Secondary <0.450069,-0.880416,-0.149351>
        Geometry Cylinder { 
            Radius 0.214055
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_960_193616320 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <21.5875,0>
    }
}

Shape SHAPEID_960_209164696 { 
    Id  960
    ParentId  952
    Geometry  GEOMID_960_195926612
    Appearance  APPID_960_193616320
}

Translated GEOMID_962_193651124 { 
    Translation <-5.12459,-5.90932,50.9659>
    Geometry Oriented { 
        Primary <0.93888,-0.288598,0.187658>
        Secondary <-0.23108,-0.124302,0.964962>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_962_194905040 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <21.5875,0>
    }
}

Shape SHAPEID_962_193741920 { 
    Id  962
    ParentId  960
    Geometry  GEOMID_962_193651124
    Appearance  APPID_962_194905040
}

Translated GEOMID_962_193683620 { 
    Translation <-5.31404,-6.61421,50.8297>
    Geometry Oriented { 
        Primary <0.93888,-0.288598,0.187658>
        Secondary <-0.23108,-0.124302,0.964962>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_962_172186296 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <21.5875,0>
    }
}

Shape SHAPEID_962_193084752 { 
    Id  962
    ParentId  962
    Geometry  GEOMID_962_193683620
    Appearance  APPID_962_172186296
}

Translated GEOMID_966_193881524 { 
    Translation <-5.12459,-5.90932,50.9659>
    Geometry Oriented { 
        Primary <0.481143,-0.363947,0.797523>
        Secondary <0.249681,0.928961,0.273297>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_966_193881552 { 
    Id  966
    ParentId  960
    Geometry  GEOMID_966_193881524
    Appearance  Default
}

Translated GEOMID_968_202165772 { 
    Translation <-5.07114,-5.71048,51.0244>
    Geometry Oriented { 
        Primary <0.932384,-0.319353,0.169335>
        Secondary <0.242146,0.899634,0.36335>
        Geometry Cylinder { 
            Radius 0.207598
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_968_208486456 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <23.9861,0>
    }
}

Shape SHAPEID_968_193881632 { 
    Id  968
    ParentId  960
    Geometry  GEOMID_968_202165772
    Appearance  APPID_968_208486456
}

Translated GEOMID_970_197489820 { 
    Translation <-5.30623,-6.0622,52.4754>
    Geometry Oriented { 
        Primary <-0.535646,0.836697,0.114112>
        Secondary <-0.358087,-0.347439,0.866637>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_970_192807528 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <23.9861,0>
    }
}

Shape SHAPEID_970_199907360 { 
    Id  970
    ParentId  968
    Geometry  GEOMID_970_197489820
    Appearance  APPID_970_192807528
}

Translated GEOMID_970_192509068 { 
    Translation <-4.7384,-5.74786,52.836>
    Geometry Oriented { 
        Primary <-0.535646,0.836697,0.114112>
        Secondary <-0.358087,-0.347439,0.866637>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_970_193854936 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <23.9861,0>
    }
}

Shape SHAPEID_970_192509096 { 
    Id  970
    ParentId  970
    Geometry  GEOMID_970_192509068
    Appearance  APPID_970_193854936
}

Translated GEOMID_974_199700868 { 
    Translation <-5.30623,-6.0622,52.4754>
    Geometry Oriented { 
        Primary <-0.597489,0.365042,0.713968>
        Secondary <-0.787338,-0.435847,-0.436046>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_974_206482328 { 
    Id  974
    ParentId  968
    Geometry  GEOMID_974_199700868
    Appearance  Default
}

Translated GEOMID_976_208224732 { 
    Translation <-5.46968,-6.15268,52.3848>
    Geometry Oriented { 
        Primary <-0.522297,0.844989,0.114893>
        Secondary <-0.817665,-0.457977,-0.348828>
        Geometry Cylinder { 
            Radius 0.200827
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_976_192633392 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <26.3847,0>
    }
}

Shape SHAPEID_976_206482448 { 
    Id  976
    ParentId  968
    Geometry  GEOMID_976_208224732
    Appearance  APPID_976_192633392
}

Translated GEOMID_978_193408380 { 
    Translation <-6.02352,-6.51533,53.7474>
    Geometry Oriented { 
        Primary <-0.221043,-0.919289,-0.32565>
        Secondary <-0.0861919,-0.314189,0.94544>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_978_194775272 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <26.3847,0>
    }
}

Shape SHAPEID_978_199844528 { 
    Id  978
    ParentId  976
    Geometry  GEOMID_978_193408380
    Appearance  APPID_978_194775272
}

Translated GEOMID_978_209043196 { 
    Translation <-6.74482,-6.33932,53.7402>
    Geometry Oriented { 
        Primary <-0.221043,-0.919289,-0.32565>
        Secondary <-0.0861919,-0.314189,0.94544>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_978_200335984 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <26.3847,0>
    }
}

Shape SHAPEID_978_209043320 { 
    Id  978
    ParentId  978
    Geometry  GEOMID_978_209043196
    Appearance  APPID_978_200335984
}

Translated GEOMID_982_208776132 { 
    Translation <-6.02352,-6.51533,53.7474>
    Geometry Oriented { 
        Primary <-0.252611,-0.863571,0.436385>
        Secondary <0.967298,-0.236039,0.0928408>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_982_208776160 { 
    Id  982
    ParentId  976
    Geometry  GEOMID_982_208776132
    Appearance  Default
}

Translated GEOMID_984_207168788 { 
    Translation <-5.82926,-6.56274,53.7661>
    Geometry Oriented { 
        Primary <-0.171477,-0.936757,-0.305095>
        Secondary <0.953868,-0.235329,0.186432>
        Geometry Cylinder { 
            Radius 0.200827
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_984_192807704 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <28.7833,0>
    }
}

Shape SHAPEID_984_197489696 { 
    Id  984
    ParentId  976
    Geometry  GEOMID_984_207168788
    Appearance  APPID_984_192807704
}

Translated GEOMID_986_200133852 { 
    Translation <-6.07698,-7.10974,55.1556>
    Geometry Oriented { 
        Primary <0.737782,0.577056,0.350262>
        Secondary <-0.334448,-0.138238,0.93222>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_986_208659464 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <28.7833,0>
    }
}

Shape SHAPEID_986_207217936 { 
    Id  986
    ParentId  984
    Geometry  GEOMID_986_200133852
    Appearance  APPID_986_208659464
}

Translated GEOMID_986_196670596 { 
    Translation <-5.64161,-7.70739,55.2231>
    Geometry Oriented { 
        Primary <0.737782,0.577056,0.350262>
        Secondary <-0.334448,-0.138238,0.93222>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_986_194574472 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <28.7833,0>
    }
}

Shape SHAPEID_986_196501632 { 
    Id  986
    ParentId  986
    Geometry  GEOMID_986_196670596
    Appearance  APPID_986_194574472
}

Translated GEOMID_990_191652004 { 
    Translation <-6.07698,-7.10974,55.1556>
    Geometry Oriented { 
        Primary <0.326889,0.253064,0.91055>
        Secondary <-0.588755,0.808203,-0.0132545>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_990_194843776 { 
    Id  990
    ParentId  984
    Geometry  GEOMID_990_191652004
    Appearance  Default
}

Translated GEOMID_992_196479756 { 
    Translation <-6.19522,-6.94743,55.1529>
    Geometry Oriented { 
        Primary <0.774987,0.536448,0.334093>
        Secondary <-0.590627,0.802881,0.0808881>
        Geometry Cylinder { 
            Radius 0.193697
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_992_208564184 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <31.1819,0>
    }
}

Shape SHAPEID_992_195362144 { 
    Id  992
    ParentId  984
    Geometry  GEOMID_992_196479756
    Appearance  APPID_992_208564184
}

Translated GEOMID_994_193511476 { 
    Translation <-6.5124,-7.15259,56.6145>
    Geometry Oriented { 
        Primary <-0.968247,0.170248,-0.183067>
        Secondary <-0.235403,-0.374366,0.896903>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_994_200479976 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <31.1819,0>
    }
}

Shape SHAPEID_994_199084824 { 
    Id  994
    ParentId  992
    Geometry  GEOMID_994_193511476
    Appearance  APPID_994_200479976
}

Translated GEOMID_994_194796116 { 
    Translation <-6.44991,-6.47579,56.9134>
    Geometry Oriented { 
        Primary <-0.968247,0.170248,-0.183067>
        Secondary <-0.235403,-0.374366,0.896903>
        Geometry Scaled { 
            Scale <3.69377,3.69377,3.69377>
            Geometry leaf

        }
    }
}

Texture2D APPID_994_194098984 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <31.1819,0>
    }
}

Shape SHAPEID_994_201134328 { 
    Id  994
    ParentId  994
    Geometry  GEOMID_994_194796116
    Appearance  APPID_994_194098984
}

Translated GEOMID_998_193557692 { 
    Translation <-6.5124,-7.15259,56.6145>
    Geometry Oriented { 
        Primary <-0.848248,-0.11335,0.517327>
        Secondary <-0.0862577,-0.934214,-0.346127>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_998_195105016 { 
    Id  998
    ParentId  992
    Geometry  GEOMID_998_193557692
    Appearance  Default
}

Translated GEOMID_1000_193914676 { 
    Translation <-6.52911,-7.33355,56.5474>
    Geometry Oriented { 
        Primary <-0.97253,0.144588,-0.182426>
        Secondary <-0.0950147,-0.962011,-0.255943>
        Geometry Cylinder { 
            Radius 0.186153
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_1000_192439616 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <33.5806,0>
    }
}

Shape SHAPEID_1000_193557760 { 
    Id  1000
    ParentId  992
    Geometry  GEOMID_1000_193914676
    Appearance  APPID_1000_192439616
}

Translated GEOMID_1002_209040628 { 
    Translation <-6.98361,-7.79431,57.916>
    Geometry Oriented { 
        Primary <0.647289,-0.76119,-0.0400734>
        Secondary <-0.0754913,-0.116332,0.990337>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1002_192926208 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <33.5806,0>
    }
}

Shape SHAPEID_1002_209040752 { 
    Id  1002
    ParentId  1000
    Geometry  GEOMID_1002_209040628
    Appearance  APPID_1002_192926208
}

Translated GEOMID_1002_192486244 { 
    Translation <-7.5468,-8.26803,57.8174>
    Geometry Oriented { 
        Primary <0.647289,-0.76119,-0.0400734>
        Secondary <-0.0754913,-0.116332,0.990337>
        Geometry Scaled { 
            Scale <3.63007,3.63007,3.63007>
            Geometry leaf

        }
    }
}

Texture2D APPID_1002_191768576 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <33.5806,0>
    }
}

Shape SHAPEID_1002_192486368 { 
    Id  1002
    ParentId  1002
    Geometry  GEOMID_1002_192486244
    Appearance  APPID_1002_191768576
}

Translated GEOMID_1006_200370788 { 
    Translation <-6.98361,-7.79431,57.916>
    Geometry Oriented { 
        Primary <0.358545,-0.659007,0.661177>
        Secondary <0.746349,0.627792,0.220999>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1006_200370816 { 
    Id  1006
    ParentId  1000
    Geometry  GEOMID_1006_200370788
    Appearance  Default
}

Translated GEOMID_1008_195556628 { 
    Translation <-6.84468,-7.67744,57.9572>
    Geometry Oriented { 
        Primary <0.652403,-0.75699,-0.036561>
        Secondary <0.726943,0.611409,0.312624>
        Geometry Cylinder { 
            Radius 0.178124
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_1008_196781304 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <35.9792,0>
    }
}

Shape SHAPEID_1008_178489280 { 
    Id  1008
    ParentId  1000
    Geometry  GEOMID_1008_195556628
    Appearance  APPID_1008_196781304
}

Translated GEOMID_1010_193028716 { 
    Translation <-6.99183,-8.0304,59.4151>
    Geometry Oriented { 
        Primary <-0.020954,0.973102,0.229421>
        Secondary <-0.338115,-0.222848,0.91434>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1010_203278848 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <35.9792,0>
    }
}

Shape SHAPEID_1010_193028840 { 
    Id  1010
    ParentId  1008
    Geometry  GEOMID_1010_193028716
    Appearance  APPID_1010_203278848
}

Translated GEOMID_1010_195168724 { 
    Translation <-6.29323,-8.07378,59.6629>
    Geometry Oriented { 
        Primary <-0.020954,0.973102,0.229421>
        Secondary <-0.338115,-0.222848,0.91434>
        Geometry Scaled { 
            Scale <3.37043,3.37043,3.37043>
            Geometry leaf

        }
    }
}

Texture2D APPID_1010_196522328 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <35.9792,0>
    }
}

Shape SHAPEID_1010_200757536 { 
    Id  1010
    ParentId  1010
    Geometry  GEOMID_1010_195168724
    Appearance  APPID_1010_196522328
}

Translated GEOMID_1014_196421724 { 
    Translation <-6.99183,-8.0304,59.4151>
    Geometry Oriented { 
        Primary <-0.201057,0.527229,0.825594>
        Secondary <-0.960454,0.0596274,-0.271978>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1014_201303568 { 
    Id  1014
    ParentId  1008
    Geometry  GEOMID_1014_196421724
    Appearance  Default
}

Translated GEOMID_1016_201303540 { 
    Translation <-7.16291,-8.01978,59.3667>
    Geometry Oriented { 
        Primary <0.0124416,0.973907,0.226607>
        Secondary <-0.982157,0.0544325,-0.180015>
        Geometry Cylinder { 
            Radius 0.178124
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_1016_209029040 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <38.3778,0>
    }
}

Shape SHAPEID_1016_195972336 { 
    Id  1016
    ParentId  1008
    Geometry  GEOMID_1016_201303540
    Appearance  APPID_1016_209029040
}

Translated GEOMID_1018_194786548 { 
    Translation <-7.56848,-8.22319,60.8055>
    Geometry Oriented { 
        Primary <-0.703782,-0.650957,-0.28451>
        Secondary <-0.084622,-0.320817,0.943353>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1018_192544416 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <38.3778,0>
    }
}

Shape SHAPEID_1018_196539008 { 
    Id  1018
    ParentId  1016
    Geometry  GEOMID_1018_194786548
    Appearance  APPID_1018_192544416
}

Translated GEOMID_1018_201386092 { 
    Translation <-8.09221,-7.71235,60.9323>
    Geometry Oriented { 
        Primary <-0.703782,-0.650957,-0.28451>
        Secondary <-0.084622,-0.320817,0.943353>
        Geometry Scaled { 
            Scale <2.56155,2.56155,2.56155>
            Geometry leaf

        }
    }
}

Texture2D APPID_1018_199177312 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <38.3778,0>
    }
}

Shape SHAPEID_1018_193826864 { 
    Id  1018
    ParentId  1018
    Geometry  GEOMID_1018_201386092
    Appearance  APPID_1018_199177312
}

Translated GEOMID_1022_200825228 { 
    Translation <-7.56848,-8.22319,60.8055>
    Geometry Oriented { 
        Primary <-0.582181,-0.663061,0.470548>
        Secondary <0.712438,-0.694896,-0.0977387>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1022_200825256 { 
    Id  1022
    ParentId  1016
    Geometry  GEOMID_1022_200825228
    Appearance  Default
}

Translated GEOMID_1024_199670204 { 
    Translation <-7.44158,-8.34696,60.7881>
    Geometry Oriented { 
        Primary <-0.675567,-0.684239,-0.274639>
        Secondary <0.712296,-0.70187,-0.00348554>
        Geometry Cylinder { 
            Radius 0.169515
            Height 1.31394
            Solid False
        }
    }
}

Texture2D APPID_1024_196281784 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <40.7764,0>
    }
}

Shape SHAPEID_1024_195070160 { 
    Id  1024
    ParentId  1016
    Geometry  GEOMID_1024_199670204
    Appearance  APPID_1024_196281784
}

Translated GEOMID_1026_192678948 { 
    Translation <-7.67991,-8.77533,62.0344>
    Geometry Oriented { 
        Primary <0.976869,0.0649493,0.203736>
        Secondary <-0.202059,-0.0314879,0.978867>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1026_200106104 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <40.7764,0>
    }
}

Shape SHAPEID_1026_195097688 { 
    Id  1026
    ParentId  1024
    Geometry  GEOMID_1026_192678948
    Appearance  APPID_1026_200106104
}

Translated GEOMID_1026_199550500 { 
    Translation <-7.62794,-9.51589,62.0213>
    Geometry Oriented { 
        Primary <0.976869,0.0649493,0.203736>
        Secondary <-0.202059,-0.0314879,0.978867>
        Geometry Scaled { 
            Scale <1.27595,1.27595,1.27595>
            Geometry leaf

        }
    }
}

Texture2D APPID_1026_172184360 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <40.7764,0>
    }
}

Shape SHAPEID_1026_195097792 { 
    Id  1026
    ParentId  1026
    Geometry  GEOMID_1026_199550500
    Appearance  APPID_1026_172184360
}

Translated GEOMID_1030_199226628 { 
    Translation <-7.67991,-8.77533,62.0344>
    Geometry Oriented { 
        Primary <0.552758,-0.0459451,0.832074>
        Secondary <-0.0696444,0.992439,0.101066>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1030_199226656 { 
    Id  1030
    ParentId  1024
    Geometry  GEOMID_1030_199226628
    Appearance  Default
}

Translated GEOMID_1032_199631676 { 
    Translation <-7.69172,-8.6071,62.0515>
    Geometry Oriented { 
        Primary <0.981174,0.0324262,0.190386>
        Secondary <-0.070148,0.978313,0.194891>
        Geometry Cylinder { 
            Radius 0.160201
            Height 0.943229
            Solid False
        }
    }
}

Texture2D APPID_1032_207027008 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <43.175,0>
    }
}

Shape SHAPEID_1032_192575248 { 
    Id  1032
    ParentId  1024
    Geometry  GEOMID_1032_199631676
    Appearance  APPID_1032_207027008
}

Translated GEOMID_1034_195308724 { 
    Translation <-7.76553,-8.68343,63.0126>
    Geometry Oriented { 
        Primary <-0.770105,0.637863,-0.00832152>
        Secondary <-0.255518,-0.296487,0.92022>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1034_192871232 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <43.175,0>
    }
}

Shape SHAPEID_1034_202083744 { 
    Id  1034
    ParentId  1032
    Geometry  GEOMID_1034_195308724
    Appearance  APPID_1034_192871232
}

Translated GEOMID_1034_196726772 { 
    Translation <-7.33153,-8.15567,63.3031>
    Geometry Oriented { 
        Primary <-0.770105,0.637863,-0.00832152>
        Secondary <-0.255518,-0.296487,0.92022>
        Geometry Scaled { 
            Scale <0.467066,0.467066,0.467066>
            Geometry leaf

        }
    }
}

Texture2D APPID_1034_196781144 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <43.175,0>
    }
}

Shape SHAPEID_1034_191618792 { 
    Id  1034
    ParentId  1034
    Geometry  GEOMID_1034_196726772
    Appearance  APPID_1034_196781144
}

Translated GEOMID_1038_209516468 { 
    Translation <-7.76553,-8.68343,63.0126>
    Geometry Oriented { 
        Primary <-0.699719,0.272406,0.660446>
        Secondary <-0.598681,-0.728028,-0.334>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1038_209516496 { 
    Id  1038
    ParentId  1032
    Geometry  GEOMID_1038_209516468
    Appearance  Default
}

Translated GEOMID_1040_196346908 { 
    Translation <-7.86144,-8.80006,62.9591>
    Geometry Oriented { 
        Primary <-0.770861,0.63695,-0.00827484>
        Secondary <-0.616333,-0.749066,-0.242968>
        Geometry Cylinder { 
            Radius 0.15
            Height 0.435931
            Solid False
        }
    }
}

Texture2D APPID_1040_207051536 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <45.5736,0>
    }
}

Shape SHAPEID_1040_196347032 { 
    Id  1040
    ParentId  1032
    Geometry  GEOMID_1040_196346908
    Appearance  APPID_1040_207051536
}

Translated GEOMID_1042_196604628 { 
    Translation <-8.07973,-8.89801,63.3673>
    Geometry Oriented { 
        Primary <0.124791,-0.979067,-0.160797>
        Secondary <0.00573029,-0.16135,0.986881>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1042_192803328 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <45.5736,0>
    }
}

Shape SHAPEID_1042_191730112 { 
    Id  1042
    ParentId  1040
    Geometry  GEOMID_1042_196604628
    Appearance  APPID_1042_192803328
}

Translated GEOMID_1042_193512380 { 
    Translation <-8.81642,-8.99013,63.3565>
    Geometry Oriented { 
        Primary <0.124791,-0.979067,-0.160797>
        Secondary <0.00573029,-0.16135,0.986881>
        Geometry Scaled { 
            Scale <0.207431,0.207431,0.207431>
            Geometry leaf

        }
    }
}

Texture2D APPID_1042_165390656 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <45.5736,0>
    }
}

Shape SHAPEID_1042_193512504 { 
    Id  1042
    ParentId  1042
    Geometry  GEOMID_1042_193512380
    Appearance  APPID_1042_165390656
}

Translated GEOMID_1046_200235780 { 
    Translation <-8.07973,-8.89801,63.3673>
    Geometry Oriented { 
        Primary <0.0440159,-0.812433,0.58139>
        Secondary <0.987514,0.123493,0.0978065>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1046_200235808 { 
    Id  1046
    ParentId  1040
    Geometry  GEOMID_1046_200235780
    Appearance  Default
}

Translated GEOMID_1048_172522596 { 
    Translation <-7.93161,-8.87948,63.3819>
    Geometry Oriented { 
        Primary <0.150563,-0.977107,-0.150308>
        Secondary <0.974007,0.120587,0.191755>
        Geometry Cylinder { 
            Radius 0.15
            Height 0.158856
            Solid False
        }
    }
}

Texture2D APPID_1048_200172752 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <47.9722,0>
    }
}

Shape SHAPEID_1048_172522624 { 
    Id  1048
    ParentId  1040
    Geometry  GEOMID_1048_172522596
    Appearance  APPID_1048_200172752
}

Translated GEOMID_1050_200235884 { 
    Translation <-7.83625,-8.9925,63.5534>
    Geometry Oriented { 
        Primary <0.517781,0.822241,0.236269>
        Secondary <-0.287228,-0.0930645,0.953331>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1050_192819080 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <47.9722,0>
    }
}

Shape SHAPEID_1050_206498040 { 
    Id  1050
    ParentId  1048
    Geometry  GEOMID_1050_200235884
    Appearance  APPID_1050_192819080
}

Translated GEOMID_1050_208114468 { 
    Translation <-7.2379,-9.4094,63.693>
    Geometry Oriented { 
        Primary <0.517781,0.822241,0.236269>
        Secondary <-0.287228,-0.0930645,0.953331>
        Geometry Scaled { 
            Scale <0.143727,0.143727,0.143727>
            Geometry leaf

        }
    }
}

Texture2D APPID_1050_199541704 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <47.9722,0>
    }
}

Shape SHAPEID_1050_201792520 { 
    Id  1050
    ParentId  1050
    Geometry  GEOMID_1050_208114468
    Appearance  APPID_1050_199541704
}

Translated GEOMID_1054_200929988 { 
    Translation <-7.83625,-8.9925,63.5534>
    Geometry Oriented { 
        Primary <0.21352,0.480423,0.850648>
        Secondary <-0.814932,0.567804,-0.116125>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1054_200930016 { 
    Id  1054
    ParentId  1048
    Geometry  GEOMID_1054_200929988
    Appearance  Default
}

Translated GEOMID_1056_193744268 { 
    Translation <-7.83625,-8.9925,63.5534>
    Geometry Oriented { 
        Primary <0.531964,0.812359,0.23893>
        Secondary <-0.814932,0.567804,-0.116125>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1056_193744296 { 
    Id  1056
    ParentId  1048
    Geometry  GEOMID_1056_193744268
    Appearance  Default
}

Translated GEOMID_1058_201792716 { 
    Translation <0.0208253,-0.0943631,38.5964>
    Geometry Oriented { 
        Primary <0.674767,0.73802,0.00394592>
        Secondary <-0.738019,0.674716,0.00932412>
        Geometry Cylinder { 
            Radius 0.336015
            Height 1.5
            Solid False
        }
    }
}

Texture2D APPID_1058_195506368 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <88.7486,0>
    }
}

Shape SHAPEID_1058_208358920 { 
    Id  1058
    ParentId  880
    Geometry  GEOMID_1058_201792716
    Appearance  APPID_1058_195506368
}

Translated GEOMID_1060_192600412 { 
    Translation <-0.00239006,0.225251,40.1257>
    Geometry Oriented { 
        Primary <-0.996043,-0.088806,0.00334594>
        Secondary <0.0175923,-0.16013,0.986939>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.75
            Solid False
        }
    }
}

Texture2D APPID_1060_200781856 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <88.7486,0>
    }
}

Shape SHAPEID_1060_192600536 { 
    Id  1060
    ParentId  1058
    Geometry  GEOMID_1060_192600412
    Appearance  APPID_1060_200781856
}

Translated GEOMID_1060_195382252 { 
    Translation <-0.0677228,0.962571,40.2465>
    Geometry Oriented { 
        Primary <-0.996043,-0.088806,0.00334594>
        Secondary <0.0175923,-0.16013,0.986939>
        Geometry Scaled { 
            Scale <3.75,3.75,3.75>
            Geometry leaf

        }
    }
}

Texture2D APPID_1060_200104400 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <88.7486,0>
    }
}

Shape SHAPEID_1060_195382376 { 
    Id  1060
    ParentId  1060
    Geometry  GEOMID_1060_195382252
    Appearance  APPID_1060_200104400
}

Translated GEOMID_1064_194927620 { 
    Translation <-0.00239006,0.225251,40.1257>
    Geometry Oriented { 
        Primary <-0.696476,-0.124032,0.706779>
        Secondary <0.0879242,-0.992277,-0.0874912>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1064_194927648 { 
    Id  1064
    ParentId  1058
    Geometry  GEOMID_1064_194927620
    Appearance  Default
}

Translated GEOMID_1066_208359052 { 
    Translation <0.0271538,-0.108169,40.0963>
    Geometry Oriented { 
        Primary <-0.996089,-0.0882957,0.00322054>
        Secondary <0.0883178,-0.996064,0.00751705>
        Geometry Cylinder { 
            Radius 0.332767
            Height 1.5
            Solid False
        }
    }
}

Texture2D APPID_1066_171539584 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <91.1472,0>
    }
}

Shape SHAPEID_1066_194927728 { 
    Id  1066
    ParentId  1058
    Geometry  GEOMID_1066_208359052
    Appearance  APPID_1066_171539584
}

Translated GEOMID_1068_193349860 { 
    Translation <-0.170558,-0.359771,41.6248>
    Geometry Oriented { 
        Primary <0.79431,-0.607507,0.0026695>
        Secondary <0.0947652,0.128243,0.987205>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.75
            Solid False
        }
    }
}

Texture2D APPID_1068_194988608 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <91.1472,0>
    }
}

Shape SHAPEID_1068_192771696 { 
    Id  1068
    ParentId  1066
    Geometry  GEOMID_1068_193349860
    Appearance  APPID_1068_194988608
}

Translated GEOMID_1068_194104700 { 
    Translation <-0.620615,-0.947691,41.7444>
    Geometry Oriented { 
        Primary <0.79431,-0.607507,0.0026695>
        Secondary <0.0947652,0.128243,0.987205>
        Geometry Scaled { 
            Scale <3.75,3.75,3.75>
            Geometry leaf

        }
    }
}

Texture2D APPID_1068_208285176 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <91.1472,0>
    }
}

Shape SHAPEID_1068_192771920 { 
    Id  1068
    ParentId  1068
    Geometry  GEOMID_1068_194104700
    Appearance  APPID_1068_208285176
}

Translated GEOMID_1072_194678028 { 
    Translation <-0.170558,-0.359771,41.6248>
    Geometry Oriented { 
        Primary <0.596922,-0.380366,0.706404>
        Secondary <0.605612,0.791125,-0.0857664>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1072_194678056 { 
    Id  1072
    ParentId  1066
    Geometry  GEOMID_1072_194678028
    Appearance  Default
}

Translated GEOMID_1074_193935844 { 
    Translation <0.03097,-0.0965106,41.5962>
    Geometry Oriented { 
        Primary <0.794062,-0.607832,0.00256882>
        Secondary <0.607789,0.794045,0.00924834>
        Geometry Cylinder { 
            Radius 0.329472
            Height 1.5
            Solid False
        }
    }
}

Texture2D APPID_1074_182459144 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <93.5458,0>
    }
}

Shape SHAPEID_1074_194678136 { 
    Id  1074
    ParentId  1066
    Geometry  GEOMID_1074_193935844
    Appearance  APPID_1074_182459144
}

Translated GEOMID_1076_208493220 { 
    Translation <0.34266,-0.0478113,43.1247>
    Geometry Oriented { 
        Primary <-0.175477,0.984474,0.00429809>
        Secondary <-0.156951,-0.0322852,0.987079>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.75
            Solid False
        }
    }
}

Texture2D APPID_1076_195557184 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <93.5458,0>
    }
}

Shape SHAPEID_1076_201807176 { 
    Id  1076
    ParentId  1074
    Geometry  GEOMID_1076_208493220
    Appearance  APPID_1076_195557184
}

Translated GEOMID_1076_208786932 { 
    Translation <1.07158,0.0815902,43.2448>
    Geometry Oriented { 
        Primary <-0.175477,0.984474,0.00429809>
        Secondary <-0.156951,-0.0322852,0.987079>
        Geometry Scaled { 
            Scale <3.75,3.75,3.75>
            Geometry leaf

        }
    }
}

Texture2D APPID_1076_201473496 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <93.5458,0>
    }
}

Shape SHAPEID_1076_208787056 { 
    Id  1076
    ParentId  1076
    Geometry  GEOMID_1076_208786932
    Appearance  APPID_1076_201473496
}

Translated GEOMID_1080_201678740 { 
    Translation <0.34266,-0.0478113,43.1247>
    Geometry Oriented { 
        Primary <-0.183583,0.682438,0.707514>
        Secondary <-0.98091,-0.174136,-0.0865578>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1080_194756704 { 
    Id  1080
    ParentId  1074
    Geometry  GEOMID_1080_201678740
    Appearance  Default
}

Translated GEOMID_1082_193788116 { 
    Translation <0.0194782,-0.105184,43.0962>
    Geometry Oriented { 
        Primary <-0.174829,0.98459,0.00413645>
        Secondary <-0.984557,-0.174859,0.00845392>
        Geometry Cylinder { 
            Radius 0.329472
            Height 1.22836
            Solid False
        }
    }
}

Texture2D APPID_1082_194516552 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <95.9444,0>
    }
}

Shape SHAPEID_1082_201678808 { 
    Id  1082
    ParentId  1074
    Geometry  GEOMID_1082_193788116
    Appearance  APPID_1082_194516552
}

Translated GEOMID_1084_200238020 { 
    Translation <-0.246441,0.0676483,44.3532>
    Geometry Oriented { 
        Primary <-0.535919,-0.844265,0.00262723>
        Secondary <0.136981,-0.0838807,0.987016>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.614182
            Solid False
        }
    }
}

Texture2D APPID_1084_194526392 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <95.9444,0>
    }
}

Shape SHAPEID_1084_200238144 { 
    Id  1084
    ParentId  1082
    Geometry  GEOMID_1084_200238020
    Appearance  APPID_1084_194526392
}

Translated GEOMID_1084_209111684 { 
    Translation <-0.758106,0.392747,44.4518>
    Geometry Oriented { 
        Primary <-0.535919,-0.844265,0.00262723>
        Secondary <0.136981,-0.0838807,0.987016>
        Geometry Scaled { 
            Scale <3.07091,3.07091,3.07091>
            Geometry leaf

        }
    }
}

Texture2D APPID_1084_184289008 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <95.9444,0>
    }
}

Shape SHAPEID_1084_201017152 { 
    Id  1084
    ParentId  1084
    Geometry  GEOMID_1084_209111684
    Appearance  APPID_1084_184289008
}

Translated GEOMID_1088_194063652 { 
    Translation <-0.246441,0.0676483,44.3532>
    Geometry Oriented { 
        Primary <-0.326132,-0.628316,0.706298>
        Secondary <0.840838,-0.534248,-0.0870058>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1088_194063680 { 
    Id  1088
    ParentId  1082
    Geometry  GEOMID_1088_194063652
    Appearance  Default
}

Translated GEOMID_1090_203269732 { 
    Translation <0.0305911,-0.108371,44.3245>
    Geometry Oriented { 
        Primary <-0.536259,-0.84405,0.00252859>
        Secondary <0.844036,-0.536226,0.00800431>
        Geometry Cylinder { 
            Radius 0.332767
            Height 1.3422
            Solid False
        }
    }
}

Texture2D APPID_1090_192897112 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <98.3431,0>
    }
}

Shape SHAPEID_1090_209185424 { 
    Id  1090
    ParentId  1082
    Geometry  GEOMID_1090_203269732
    Appearance  APPID_1090_192897112
}

Translated GEOMID_1092_200238516 { 
    Translation <0.109546,-0.419887,45.6951>
    Geometry Oriented { 
        Primary <0.965454,0.260549,0.00349819>
        Secondary <-0.0448502,0.152936,0.987218>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.6711
            Solid False
        }
    }
}

Texture2D APPID_1092_197101584 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <98.3431,0>
    }
}

Shape SHAPEID_1092_200238640 { 
    Id  1092
    ParentId  1090
    Geometry  GEOMID_1092_200238516
    Appearance  APPID_1092_197101584
}

Translated GEOMID_1092_196054636 { 
    Translation <0.281807,-1.05963,45.8021>
    Geometry Oriented { 
        Primary <0.965454,0.260549,0.00349819>
        Secondary <-0.0448502,0.152936,0.987218>
        Geometry Scaled { 
            Scale <3.3555,3.3555,3.3555>
            Geometry leaf

        }
    }
}

Texture2D APPID_1092_197097192 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <98.3431,0>
    }
}

Shape SHAPEID_1092_200238720 { 
    Id  1092
    ParentId  1092
    Geometry  GEOMID_1092_196054636
    Appearance  APPID_1092_197097192
}

Translated GEOMID_1096_195032260 { 
    Translation <0.109546,-0.419887,45.6951>
    Geometry Oriented { 
        Primary <0.664559,0.241896,0.706999>
        Secondary <-0.25905,0.962058,-0.085664>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1096_192546768 { 
    Id  1096
    ParentId  1090
    Geometry  GEOMID_1096_195032260
    Appearance  Default
}

Translated GEOMID_1098_192546740 { 
    Translation <0.0233431,-0.0997456,45.6666>
    Geometry Oriented { 
        Primary <0.965594,0.260031,0.0033662>
        Secondary <-0.260052,0.965549,0.00935112>
        Geometry Cylinder { 
            Radius 0.347391
            Height 1.0002
            Solid False
        }
    }
}

Texture2D APPID_1098_194121632 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <100.742,0>
    }
}

Shape SHAPEID_1098_195032288 { 
    Id  1098
    ParentId  1090
    Geometry  GEOMID_1098_192546740
    Appearance  APPID_1098_194121632
}

Translated GEOMID_1100_202138228 { 
    Translation <0.181936,0.197515,46.6971>
    Geometry Oriented { 
        Primary <-0.887867,0.460084,0.00378599>
        Secondary <-0.0706313,-0.144426,0.986992>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.5001
            Solid False
        }
    }
}

Texture2D APPID_1100_165718744 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <100.742,0>
    }
}

Shape SHAPEID_1100_202138352 { 
    Id  1100
    ParentId  1098
    Geometry  GEOMID_1100_202138228
    Appearance  APPID_1100_165718744
}

Translated GEOMID_1100_194160532 { 
    Translation <0.409305,0.635628,46.7774>
    Geometry Oriented { 
        Primary <-0.887867,0.460084,0.00378599>
        Secondary <-0.0706313,-0.144426,0.986992>
        Geometry Scaled { 
            Scale <2.5005,2.5005,2.5005>
            Geometry leaf

        }
    }
}

Texture2D APPID_1100_194993072 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <100.742,0>
    }
}

Shape SHAPEID_1100_203216144 { 
    Id  1100
    ParentId  1100
    Geometry  GEOMID_1100_194160532
    Appearance  APPID_1100_194993072
}

Translated GEOMID_1104_208634028 { 
    Translation <0.181936,0.197515,46.6971>
    Geometry Oriented { 
        Primary <-0.6537,0.269566,0.707114>
        Secondary <-0.458883,-0.884213,-0.0871394>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1104_208634056 { 
    Id  1104
    ParentId  1098
    Geometry  GEOMID_1104_208634028
    Appearance  Default
}

Translated GEOMID_1106_192675100 { 
    Translation <0.0225243,-0.109652,46.6668>
    Geometry Oriented { 
        Primary <-0.887599,0.460602,0.00364392>
        Secondary <-0.460616,-0.887557,-0.00871013>
        Geometry Frustum { 
            Radius 0.347391
            Height 0.5
            Taper 0.991109
            Solid False
        }
    }
}

Shape SHAPEID_1106_192675128 { 
    Id  1106
    ParentId  1098
    Geometry  GEOMID_1106_192675100
    Appearance  Color_3
}

Translated GEOMID_1107_200878348 { 
    Translation <0.0221354,-0.114357,47.1668>
    Geometry Oriented { 
        Primary <-0.8876,0.460601,0.00346173>
        Secondary <-0.460562,-0.887588,0.0083057>
        Geometry Cylinder { 
            Radius 0.344302
            Height 0.4667
            Solid False
        }
    }
}

Texture2D APPID_1107_200210952 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <103.14,0>
    }
}

Shape SHAPEID_1107_199039856 { 
    Id  1107
    ParentId  1106
    Geometry  GEOMID_1107_200878348
    Appearance  APPID_1107_200210952
}

Translated GEOMID_1109_194466364 { 
    Translation <-0.29682,-0.229394,47.6632>
    Geometry Oriented { 
        Primary <0.343692,-0.939078,0.00301964>
        Secondary <0.149321,0.057824,0.987096>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.23335
            Solid False
        }
    }
}

Texture2D APPID_1109_199788280 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <103.14,0>
    }
}

Shape SHAPEID_1109_201365856 { 
    Id  1109
    ParentId  1107
    Geometry  GEOMID_1109_194466364
    Appearance  APPID_1109_199788280
}

Translated GEOMID_1109_200211380 { 
    Translation <-0.513167,-0.308454,47.7006>
    Geometry Oriented { 
        Primary <0.343692,-0.939078,0.00301964>
        Secondary <0.149321,0.057824,0.987096>
        Geometry Scaled { 
            Scale <1.16675,1.16675,1.16675>
            Geometry leaf

        }
    }
}

Texture2D APPID_1109_196456456 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <103.14,0>
    }
}

Shape SHAPEID_1109_199742936 { 
    Id  1109
    ParentId  1109
    Geometry  GEOMID_1109_200211380
    Appearance  APPID_1109_196456456
}

Translated GEOMID_1113_208524868 { 
    Translation <-0.29682,-0.229394,47.6632>
    Geometry Oriented { 
        Primary <0.299564,-0.641064,0.70661>
        Secondary <0.935732,0.341948,-0.086471>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1113_208524896 { 
    Id  1113
    ParentId  1107
    Geometry  GEOMID_1113_208524868
    Appearance  Default
}

Translated GEOMID_1115_199743092 { 
    Translation <0.0253548,-0.111661,47.6335>
    Geometry Oriented { 
        Primary <0.343258,-0.939237,0.00290605>
        Secondary <0.939198,0.34327,0.00854115>
        Geometry Cylinder { 
            Radius 0.344302
            Height 0.896774
            Solid False
        }
    }
}

Texture2D APPID_1115_195376272 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <105.539,0>
    }
}

Shape SHAPEID_1115_208524976 { 
    Id  1115
    ParentId  1107
    Geometry  GEOMID_1115_199743092
    Appearance  APPID_1115_195376272
}

Translated GEOMID_1117_199090404 { 
    Translation <0.334346,-0.242692,48.5599>
    Geometry Oriented { 
        Primary <0.380928,0.924598,0.00358119>
        Secondary <-0.149209,0.0576496,0.987124>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.448387
            Solid False
        }
    }
}

Texture2D APPID_1117_195128888 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <105.539,0>
    }
}

Shape SHAPEID_1117_199090528 { 
    Id  1117
    ParentId  1115
    Geometry  GEOMID_1117_199090404
    Appearance  APPID_1117_195128888
}

Translated GEOMID_1117_193420540 { 
    Translation <0.743493,-0.411536,48.6316>
    Geometry Oriented { 
        Primary <0.380928,0.924598,0.00358119>
        Secondary <-0.149209,0.0576496,0.987124>
        Geometry Scaled { 
            Scale <2.24194,2.24194,2.24194>
            Geometry leaf

        }
    }
}

Texture2D APPID_1117_195308920 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <105.539,0>
    }
}

Shape SHAPEID_1117_199779432 { 
    Id  1117
    ParentId  1117
    Geometry  GEOMID_1117_193420540
    Appearance  APPID_1117_195308920
}

Translated GEOMID_1121_193961052 { 
    Translation <0.0172661,-0.111842,48.5302>
    Geometry Oriented { 
        Primary <0.274015,0.678778,0.681305>
        Secondary <-0.924475,0.38116,-0.00793063>
        Geometry Cylinder { 
            Radius 0.214055
            Solid False
        }
    }
}

Shape SHAPEID_1121_199779592 { 
    Id  1121
    ParentId  1115
    Geometry  GEOMID_1121_193961052
    Appearance  APPID_6_201601160
}

Translated GEOMID_1122_208486660 { 
    Translation <-0.247803,-0.739519,49.2621>
    Geometry Oriented { 
        Primary <0.283747,0.701823,0.653401>
        Secondary <-0.924588,0.380892,-0.00760581>
        Geometry Cylinder { 
            Radius 0.214055
            Height 0.5
            Solid False
        }
    }
}

Shape SHAPEID_1122_169989280 { 
    Id  1122
    ParentId  1121
    Geometry  GEOMID_1122_208486660
    Appearance  Color_3
}

Translated GEOMID_1123_194899708 { 
    Translation <-0.374909,-1.0405,49.6406>
    Geometry Oriented { 
        Primary <0.292045,0.723037,0.626041>
        Secondary <-0.928813,0.37051,0.00537161>
        Geometry Cylinder { 
            Radius 0.214055
            Height 0.68703
            Solid False
        }
    }
}

Shape SHAPEID_1123_208486768 { 
    Id  1123
    ParentId  1122
    Geometry  GEOMID_1123_194899708
    Appearance  APPID_3_195328248
}

Translated GEOMID_1125_201558612 { 
    Translation <-0.633003,-1.28264,50.2785>
    Geometry Oriented { 
        Primary <-0.869246,-0.241471,-0.431397>
        Secondary <-0.183064,-0.65336,0.73458>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.343515
            Solid False
        }
    }
}

Shape SHAPEID_1125_194899928 { 
    Id  1125
    ParentId  1123
    Geometry  GEOMID_1125_201558612
    Appearance  APPID_5_196508344
}

Translated GEOMID_1125_208789916 { 
    Translation <-0.790758,-1.03617,50.4584>
    Geometry Oriented { 
        Primary <-0.869246,-0.241471,-0.431397>
        Secondary <-0.183064,-0.65336,0.73458>
        Geometry Scaled { 
            Scale <1.71757,1.71757,1.71757>
            Geometry leaf

        }
    }
}

Shape SHAPEID_1125_208789944 { 
    Id  1125
    ParentId  1125
    Geometry  GEOMID_1125_208789916
    Appearance  APPID_5_196508344
}

Translated GEOMID_1129_202082724 { 
    Translation <-0.633003,-1.28264,50.2785>
    Geometry Oriented { 
        Primary <-0.750397,-0.622897,0.221144>
        Secondary <0.47372,-0.740131,-0.47728>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1129_202082752 { 
    Id  1129
    ParentId  1123
    Geometry  GEOMID_1129_202082724
    Appearance  Default
}

Translated GEOMID_1131_202082868 { 
    Translation <-0.531601,-1.44107,50.1764>
    Geometry Oriented { 
        Primary <-0.848527,-0.296521,-0.438266>
        Secondary <0.478281,-0.784117,-0.395483>
        Geometry Cylinder { 
            Radius 0.207598
            Height 0.495
            Solid False
        }
    }
}

Texture2D APPID_1131_200332496 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_1131_202082792 { 
    Id  1131
    ParentId  1123
    Geometry  GEOMID_1131_202082868
    Appearance  APPID_1131_200332496
}

Translated GEOMID_1133_194990708 { 
    Translation <-0.692836,-1.88445,50.4731>
    Geometry Oriented { 
        Primary <0.952221,-0.298778,0.0633029>
        Secondary <-0.175893,-0.367053,0.913418>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.2475
            Solid False
        }
    }
}

Texture2D APPID_1133_194792000 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_1133_194990832 { 
    Id  1133
    ParentId  1131
    Geometry  GEOMID_1133_194990708
    Appearance  APPID_1133_194792000
}

Translated GEOMID_1133_199930084 { 
    Translation <-0.75463,-2.10247,50.3736>
    Geometry Oriented { 
        Primary <0.952221,-0.298778,0.0633029>
        Secondary <-0.175893,-0.367053,0.913418>
        Geometry Scaled { 
            Scale <1.2375,1.2375,1.2375>
            Geometry leaf

        }
    }
}

Texture2D APPID_1133_207123280 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_1133_199930112 { 
    Id  1133
    ParentId  1133
    Geometry  GEOMID_1133_199930084
    Appearance  APPID_1133_207123280
}

Translated GEOMID_1137_200999396 { 
    Translation <-0.692836,-1.88445,50.4731>
    Geometry Oriented { 
        Primary <0.529762,-0.538502,0.655262>
        Secondary <0.236882,0.835778,0.49534>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1137_200999424 { 
    Id  1137
    ParentId  1131
    Geometry  GEOMID_1137_200999396
    Appearance  Default
}

Translated GEOMID_1139_195099924 { 
    Translation <-0.64366,-1.71094,50.5759>
    Geometry Oriented { 
        Primary <0.949398,-0.309482,0.0535172>
        Secondary <0.223922,0.786464,0.575616>
        Geometry Cylinder { 
            Radius 0.200827
            Height 0.153238
            Solid False
        }
    }
}

Texture2D APPID_1139_194796280 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_1139_200999504 { 
    Id  1139
    ParentId  1131
    Geometry  GEOMID_1139_195099924
    Appearance  APPID_1139_194796280
}

Translated GEOMID_1141_194465932 { 
    Translation <-0.52027,-1.72061,50.803>
    Geometry Oriented { 
        Primary <-0.581502,0.744417,0.328175>
        Secondary <-0.296852,-0.569729,0.766347>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.0766191
            Solid False
        }
    }
}

Texture2D APPID_1141_199932688 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_1141_194466056 { 
    Id  1141
    ParentId  1139
    Geometry  GEOMID_1141_194465932
    Appearance  APPID_1141_199932688
}

Translated GEOMID_1141_199168924 { 
    Translation <-0.462235,-1.69393,50.8453>
    Geometry Oriented { 
        Primary <-0.581502,0.744417,0.328175>
        Secondary <-0.296852,-0.569729,0.766347>
        Geometry Scaled { 
            Scale <0.383095,0.383095,0.383095>
            Geometry leaf

        }
    }
}

Texture2D APPID_1141_199696904 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_1141_201049744 { 
    Id  1141
    ParentId  1141
    Geometry  GEOMID_1141_199168924
    Appearance  APPID_1141_199696904
}

Translated GEOMID_1145_195963684 { 
    Translation <-0.52027,-1.72061,50.803>
    Geometry Oriented { 
        Primary <-0.583999,0.140575,0.79949>
        Secondary <-0.782454,-0.359707,-0.508307>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1145_195963712 { 
    Id  1145
    ParentId  1139
    Geometry  GEOMID_1145_195963684
    Appearance  Default
}

Translated GEOMID_1147_171404764 { 
    Translation <-0.677408,-1.79285,50.7009>
    Geometry Oriented { 
        Primary <-0.544678,0.76924,0.33406>
        Secondary <-0.811785,-0.383595,-0.440295>
        Geometry Cylinder { 
            Radius 0.200827
            Height 0.5
            Solid False
        }
    }
}

Shape SHAPEID_1147_199213592 { 
    Id  1147
    ParentId  1139
    Geometry  GEOMID_1147_171404764
    Appearance  Color_3
}

Translated GEOMID_1148_199213788 { 
    Translation <-0.782682,-2.04835,51.1176>
    Geometry Oriented { 
        Primary <-0.54129,0.77794,0.319083>
        Secondary <-0.819653,-0.403541,-0.406599>
        Geometry Cylinder { 
            Radius 0.200827
            Height 1.02548
            Solid False
        }
    }
}

Texture2D APPID_1148_199072856 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_1148_199213712 { 
    Id  1148
    ParentId  1147
    Geometry  GEOMID_1148_199213788
    Appearance  APPID_1148_199072856
}

Translated GEOMID_1150_201271476 { 
    Translation <-1.1705,-2.49629,51.9952>
    Geometry Oriented { 
        Primary <-0.234974,-0.827307,-0.510246>
        Secondary <-0.0527339,-0.51332,0.856576>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.512741
            Solid False
        }
    }
}

Texture2D APPID_1150_209516728 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_1150_201271600 { 
    Id  1150
    ParentId  1148
    Geometry  GEOMID_1150_201271476
    Appearance  APPID_1150_209516728
}

Translated GEOMID_1150_193058940 { 
    Translation <-1.66816,-2.37929,52.0347>
    Geometry Oriented { 
        Primary <-0.234974,-0.827307,-0.510246>
        Secondary <-0.0527339,-0.51332,0.856576>
        Geometry Scaled { 
            Scale <2.5637,2.5637,2.5637>
            Geometry leaf

        }
    }
}

Texture2D APPID_1150_192955272 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_1150_195031688 { 
    Id  1150
    ParentId  1150
    Geometry  GEOMID_1150_193058940
    Appearance  APPID_1150_192955272
}

Translated GEOMID_1154_196777604 { 
    Translation <-1.1705,-2.49629,51.9952>
    Geometry Oriented { 
        Primary <-0.22222,-0.943551,0.245621>
        Secondary <0.973458,-0.228859,0.00155125>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1154_195031872 { 
    Id  1154
    ParentId  1148
    Geometry  GEOMID_1154_196777604
    Appearance  Default
}

Translated GEOMID_1156_195031844 { 
    Translation <-0.975008,-2.54225,51.9955>
    Geometry Oriented { 
        Primary <-0.160027,-0.858701,-0.486851>
        Secondary <0.967623,-0.233985,0.0946443>
        Geometry Cylinder { 
            Radius 0.193697
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_1156_200761616 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <9.59444,0>
    }
}

Shape SHAPEID_1156_196777672 { 
    Id  1156
    ParentId  1148
    Geometry  GEOMID_1156_195031844
    Appearance  APPID_1156_200761616
}

Translated GEOMID_1158_199064084 { 
    Translation <-1.14523,-3.36807,53.2522>
    Geometry Oriented { 
        Primary <0.723458,0.53501,0.436318>
        Secondary <-0.294247,-0.332767,0.895927>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1158_208435000 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <9.59444,0>
    }
}

Shape SHAPEID_1158_199064208 { 
    Id  1158
    ParentId  1156
    Geometry  GEOMID_1158_199064084
    Appearance  APPID_1158_208435000
}

Translated GEOMID_1158_193698076 { 
    Translation <-0.681522,-3.94466,53.1903>
    Geometry Oriented { 
        Primary <0.723458,0.53501,0.436318>
        Secondary <-0.294247,-0.332767,0.895927>
        Geometry Scaled { 
            Scale <3.69377,3.69377,3.69377>
            Geometry leaf

        }
    }
}

Texture2D APPID_1158_197101520 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <9.59444,0>
    }
}

Shape SHAPEID_1158_199064328 { 
    Id  1158
    ParentId  1158
    Geometry  GEOMID_1158_193698076
    Appearance  APPID_1158_197101520
}

Translated GEOMID_1162_192864796 { 
    Translation <-1.14523,-3.36807,53.2522>
    Geometry Oriented { 
        Primary <0.354646,0.0794076,0.931623>
        Secondary <-0.617616,0.767964,0.169653>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1162_192864824 { 
    Id  1162
    ParentId  1156
    Geometry  GEOMID_1162_192864796
    Appearance  Default
}

Translated GEOMID_1164_191629988 { 
    Translation <-1.26486,-3.21932,53.285>
    Geometry Oriented { 
        Primary <0.775698,0.48518,0.4036>
        Secondary <-0.606016,0.751157,0.261741>
        Geometry Cylinder { 
            Radius 0.186153
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_1164_209181608 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <11.9931,0>
    }
}

Shape SHAPEID_1164_192864864 { 
    Id  1164
    ParentId  1156
    Geometry  GEOMID_1164_191629988
    Appearance  APPID_1164_209181608
}

Translated GEOMID_1166_199168460 { 
    Translation <-1.51253,-3.72486,54.6824>
    Geometry Oriented { 
        Primary <-0.98024,0.162124,-0.113342>
        Secondary <-0.184041,-0.537383,0.823012>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1166_194517936 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <11.9931,0>
    }
}

Shape SHAPEID_1166_195103896 { 
    Id  1166
    ParentId  1164
    Geometry  GEOMID_1166_199168460
    Appearance  APPID_1166_194517936
}

Translated GEOMID_1166_194779316 { 
    Translation <-1.45868,-3.11036,55.0957>
    Geometry Oriented { 
        Primary <-0.98024,0.162124,-0.113342>
        Secondary <-0.184041,-0.537383,0.823012>
        Geometry Scaled { 
            Scale <3.63007,3.63007,3.63007>
            Geometry leaf

        }
    }
}

Texture2D APPID_1166_193468952 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <11.9931,0>
    }
}

Shape SHAPEID_1166_194779440 { 
    Id  1166
    ParentId  1166
    Geometry  GEOMID_1166_194779316
    Appearance  APPID_1166_193468952
}

Translated GEOMID_1170_201366220 { 
    Translation <-1.51253,-3.72486,54.6824>
    Geometry Oriented { 
        Primary <-0.820972,-0.239116,0.518487>
        Secondary <-0.0749315,-0.855108,-0.513006>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1170_201366248 { 
    Id  1170
    ParentId  1164
    Geometry  GEOMID_1170_201366220
    Appearance  Default
}

Translated GEOMID_1172_201511796 { 
    Translation <-1.52648,-3.88404,54.5869>
    Geometry Oriented { 
        Primary <-0.982395,0.147111,-0.115144>
        Secondary <-0.0843147,-0.89916,-0.429422>
        Geometry Cylinder { 
            Radius 0.178124
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_1172_192575464 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <14.3917,0>
    }
}

Shape SHAPEID_1172_201366368 { 
    Id  1172
    ParentId  1164
    Geometry  GEOMID_1172_201511796
    Appearance  APPID_1172_192575464
}

Translated GEOMID_1174_196661060 { 
    Translation <-1.90817,-4.60023,55.8633>
    Geometry Oriented { 
        Primary <0.635007,-0.741024,-0.218288>
        Secondary <-0.0256018,-0.302603,0.952773>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1174_194072072 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <14.3917,0>
    }
}

Shape SHAPEID_1174_196508736 { 
    Id  1174
    ParentId  1172
    Geometry  GEOMID_1174_196661060
    Appearance  APPID_1174_194072072
}

Translated GEOMID_1174_201385668 { 
    Translation <-2.48144,-5.0453,55.7066>
    Geometry Oriented { 
        Primary <0.635007,-0.741024,-0.218288>
        Secondary <-0.0256018,-0.302603,0.952773>
        Geometry Scaled { 
            Scale <3.37043,3.37043,3.37043>
            Geometry leaf

        }
    }
}

Texture2D APPID_1174_194877384 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <14.3917,0>
    }
}

Shape SHAPEID_1174_196661304 { 
    Id  1174
    ParentId  1174
    Geometry  GEOMID_1174_201385668
    Appearance  APPID_1174_194877384
}

Translated GEOMID_1178_201792332 { 
    Translation <-1.90817,-4.60023,55.8633>
    Geometry Oriented { 
        Primary <0.392853,-0.767506,0.506558>
        Secondary <0.753051,0.584654,0.301816>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1178_196508688 { 
    Id  1178
    ParentId  1172
    Geometry  GEOMID_1178_201792332
    Appearance  Default
}

Translated GEOMID_1180_196508660 { 
    Translation <-1.77404,-4.49609,55.9171>
    Geometry Oriented { 
        Primary <0.665468,-0.720318,-0.195689>
        Secondary <0.726571,0.565041,0.390927>
        Geometry Cylinder { 
            Radius 0.178124
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_1180_194997224 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <16.7903,0>
    }
}

Shape SHAPEID_1180_202413112 { 
    Id  1180
    ParentId  1172
    Geometry  GEOMID_1180_196508660
    Appearance  APPID_1180_194997224
}

Translated GEOMID_1182_207054212 { 
    Translation <-1.8549,-5.10585,57.2928>
    Geometry Oriented { 
        Primary <-0.0551478,0.916747,0.395642>
        Secondary <-0.292976,-0.393661,0.871319>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1182_193903984 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <16.7903,0>
    }
}

Shape SHAPEID_1182_207054336 { 
    Id  1182
    ParentId  1180
    Geometry  GEOMID_1182_207054212
    Appearance  APPID_1182_193903984
}

Translated GEOMID_1182_201671180 { 
    Translation <-1.14616,-5.15624,57.5084>
    Geometry Oriented { 
        Primary <-0.0551478,0.916747,0.395642>
        Secondary <-0.292976,-0.393661,0.871319>
        Geometry Scaled { 
            Scale <2.56155,2.56155,2.56155>
            Geometry leaf

        }
    }
}

Texture2D APPID_1182_208437344 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <16.7903,0>
    }
}

Shape SHAPEID_1182_200897904 { 
    Id  1182
    ParentId  1182
    Geometry  GEOMID_1182_201671180
    Appearance  APPID_1182_208437344
}

Translated GEOMID_1186_200218708 { 
    Translation <-1.8549,-5.10585,57.2928>
    Geometry Oriented { 
        Primary <-0.185568,0.36557,0.912098>
        Secondary <-0.971811,0.0690911,-0.225409>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1186_200218736 { 
    Id  1186
    ParentId  1180
    Geometry  GEOMID_1186_200218708
    Appearance  Default
}

Translated GEOMID_1188_201392748 { 
    Translation <-2.028,-5.09355,57.2527>
    Geometry Oriented { 
        Primary <0.0034007,0.92113,0.38924>
        Secondary <-0.989192,0.0601572,-0.133719>
        Geometry Cylinder { 
            Radius 0.169515
            Height 1.31394
            Solid False
        }
    }
}

Texture2D APPID_1188_209640536 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <19.1889,0>
    }
}

Shape SHAPEID_1188_201392872 { 
    Id  1188
    ParentId  1180
    Geometry  GEOMID_1188_201392748
    Appearance  APPID_1188_209640536
}

Translated GEOMID_1190_192864444 { 
    Translation <-2.3421,-5.48745,58.4897>
    Geometry Oriented { 
        Primary <-0.708356,-0.604045,-0.365188>
        Secondary <-0.0558648,-0.46777,0.882083>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1190_208776200 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <19.1889,0>
    }
}

Shape SHAPEID_1190_192864568 { 
    Id  1190
    ParentId  1188
    Geometry  GEOMID_1190_192864444
    Appearance  APPID_1190_208776200
}

Translated GEOMID_1190_207052540 { 
    Translation <-2.86456,-5.00837,58.7107>
    Geometry Oriented { 
        Primary <-0.708356,-0.604045,-0.365188>
        Secondary <-0.0558648,-0.46777,0.882083>
        Geometry Scaled { 
            Scale <1.27595,1.27595,1.27595>
            Geometry leaf

        }
    }
}

Texture2D APPID_1190_196216304 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <19.1889,0>
    }
}

Shape SHAPEID_1190_198970760 { 
    Id  1190
    ParentId  1190
    Geometry  GEOMID_1190_207052540
    Appearance  APPID_1190_196216304
}

Translated GEOMID_1194_198971108 { 
    Translation <-2.3421,-5.48745,58.4897>
    Geometry Oriented { 
        Primary <-0.558546,-0.741234,0.372287>
        Secondary <0.716708,-0.657212,-0.233243>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1194_193886328 { 
    Id  1194
    ParentId  1188
    Geometry  GEOMID_1194_198971108
    Appearance  Default
}

Translated GEOMID_1196_193083188 { 
    Translation <-2.22061,-5.59886,58.4502>
    Geometry Oriented { 
        Primary <-0.673816,-0.645559,-0.359479>
        Secondary <0.723154,-0.676052,-0.14143>
        Geometry Cylinder { 
            Radius 0.160201
            Height 0.943229
            Solid False
        }
    }
}

Texture2D APPID_1196_193550064 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <21.5875,0>
    }
}

Shape SHAPEID_1196_208121552 { 
    Id  1196
    ParentId  1188
    Geometry  GEOMID_1196_193083188
    Appearance  APPID_1196_193550064
}

Translated GEOMID_1198_199604652 { 
    Translation <-2.35085,-6.0883,59.2793>
    Geometry Oriented { 
        Primary <0.982625,0.0518402,0.178217>
        Secondary <-0.166529,-0.177744,0.969884>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1198_208146920 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <21.5875,0>
    }
}

Shape SHAPEID_1198_199604776 { 
    Id  1198
    ParentId  1196
    Geometry  GEOMID_1198_199604652
    Appearance  APPID_1198_208146920
}

Translated GEOMID_1198_209146660 { 
    Translation <-2.29,-6.81796,59.156>
    Geometry Oriented { 
        Primary <0.982625,0.0518402,0.178217>
        Secondary <-0.166529,-0.177744,0.969884>
        Geometry Scaled { 
            Scale <0.467066,0.467066,0.467066>
            Geometry leaf

        }
    }
}

Texture2D APPID_1198_191741360 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <21.5875,0>
    }
}

Shape SHAPEID_1198_209146784 { 
    Id  1198
    ParentId  1198
    Geometry  GEOMID_1198_209146660
    Appearance  APPID_1198_191741360
}

Translated GEOMID_1202_196471844 { 
    Translation <-2.35085,-6.0883,59.2793>
    Geometry Oriented { 
        Primary <0.583181,-0.162342,0.795956>
        Secondary <-0.0803535,0.963494,0.255386>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1202_196471872 { 
    Id  1202
    ParentId  1196
    Geometry  GEOMID_1202_196471844
    Appearance  Default
}

Translated GEOMID_1204_199520292 { 
    Translation <-2.36372,-5.93395,59.3202>
    Geometry Oriented { 
        Primary <0.986625,0.0223849,0.161463>
        Secondary <-0.0778349,0.935006,0.345984>
        Geometry Cylinder { 
            Radius 0.15
            Height 0.435931
            Solid False
        }
    }
}

Texture2D APPID_1204_191630368 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <23.9861,0>
    }
}

Shape SHAPEID_1204_200320856 { 
    Id  1204
    ParentId  1196
    Geometry  GEOMID_1204_199520292
    Appearance  APPID_1204_191630368
}

Translated GEOMID_1206_200321116 { 
    Translation <-2.33709,-5.98523,59.786>
    Geometry Oriented { 
        Primary <-0.788544,0.605297,0.108692>
        Secondary <-0.212068,-0.43354,0.875825>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1206_193903544 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <23.9861,0>
    }
}

Shape SHAPEID_1206_193386640 { 
    Id  1206
    ParentId  1204
    Geometry  GEOMID_1206_200321116
    Appearance  APPID_1206_193903544
}

Translated GEOMID_1206_199739020 { 
    Translation <-1.90847,-5.48955,60.1351>
    Geometry Oriented { 
        Primary <-0.788544,0.605297,0.108692>
        Secondary <-0.212068,-0.43354,0.875825>
        Geometry Scaled { 
            Scale <0.207431,0.207431,0.207431>
            Geometry leaf

        }
    }
}

Texture2D APPID_1206_194530760 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <23.9861,0>
    }
}

Shape SHAPEID_1206_199739144 { 
    Id  1206
    ParentId  1206
    Geometry  GEOMID_1206_199739020
    Appearance  APPID_1206_194530760
}

Translated GEOMID_1210_191734212 { 
    Translation <-2.33709,-5.98523,59.786>
    Geometry Oriented { 
        Primary <-0.681249,0.151855,0.716129>
        Secondary <-0.593815,-0.686727,-0.419272>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1210_191734240 { 
    Id  1210
    ParentId  1204
    Geometry  GEOMID_1210_191734212
    Appearance  Default
}

Translated GEOMID_1212_194980908 { 
    Translation <-2.42616,-6.08824,59.7231>
    Geometry Oriented { 
        Primary <-0.779241,0.617135,0.109217>
        Secondary <-0.61388,-0.716491,-0.331348>
        Geometry Cylinder { 
            Radius 0.15
            Height 0.158856
            Solid False
        }
    }
}

Texture2D APPID_1212_196662784 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <26.3847,0>
    }
}

Shape SHAPEID_1212_194981032 { 
    Id  1212
    ParentId  1204
    Geometry  GEOMID_1212_194980908
    Appearance  APPID_1212_196662784
}

Translated GEOMID_1214_207207164 { 
    Translation <-2.59472,-6.15679,59.8593>
    Geometry Oriented { 
        Primary <0.107908,-0.944953,-0.308902>
        Secondary <0.0334929,-0.307085,0.951093>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1214_192853832 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <26.3847,0>
    }
}

Shape SHAPEID_1214_194981152 { 
    Id  1214
    ParentId  1212
    Geometry  GEOMID_1214_207207164
    Appearance  APPID_1214_192853832
}

Translated GEOMID_1214_208481292 { 
    Translation <-3.33247,-6.24067,59.8582>
    Geometry Oriented { 
        Primary <0.107908,-0.944953,-0.308902>
        Secondary <0.0334929,-0.307085,0.951093>
        Geometry Scaled { 
            Scale <0.143727,0.143727,0.143727>
            Geometry leaf

        }
    }
}

Texture2D APPID_1214_208057320 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <26.3847,0>
    }
}

Shape SHAPEID_1214_208481416 { 
    Id  1214
    ParentId  1214
    Geometry  GEOMID_1214_208481292
    Appearance  APPID_1214_208057320
}

Translated GEOMID_1218_193709740 { 
    Translation <-2.59472,-6.15679,59.8593>
    Geometry Oriented { 
        Primary <0.0626937,-0.889564,0.452487>
        Secondary <0.990074,0.112576,0.08414>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1218_193709768 { 
    Id  1218
    ParentId  1212
    Geometry  GEOMID_1218_193709740
    Appearance  Default
}

Translated GEOMID_1220_201248668 { 
    Translation <-2.59472,-6.15679,59.8593>
    Geometry Oriented { 
        Primary <0.133276,-0.942068,-0.307807>
        Secondary <0.990074,0.112576,0.08414>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1220_201248696 { 
    Id  1220
    ParentId  1212
    Geometry  GEOMID_1220_201248668
    Appearance  Default
}

Translated GEOMID_1222_191734412 { 
    Translation <0.0172661,-0.111842,48.5302>
    Geometry Oriented { 
        Primary <0.381436,0.924389,0.00344637>
        Secondary <-0.924371,0.381396,0.00873285>
        Geometry Cylinder { 
            Radius 0.301119
            Height 1.15499
            Solid False
        }
    }
}

Texture2D APPID_1222_208643536 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <107.938,0>
    }
}

Shape SHAPEID_1222_201248816 { 
    Id  1222
    ParentId  1115
    Geometry  GEOMID_1222_191734412
    Appearance  APPID_1222_208643536
}

Translated GEOMID_1224_195598628 { 
    Translation <-0.102073,0.152337,49.7113>
    Geometry Oriented { 
        Primary <-0.905504,-0.424325,0.00331555>
        Secondary <0.0710129,-0.143828,0.987052>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.577497
            Solid False
        }
    }
}

Texture2D APPID_1224_197386112 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <107.938,0>
    }
}

Shape SHAPEID_1224_195598752 { 
    Id  1224
    ParentId  1222
    Geometry  GEOMID_1224_195598628
    Appearance  APPID_1224_197386112
}

Translated GEOMID_1224_200401524 { 
    Translation <-0.343671,0.668628,49.8039>
    Geometry Oriented { 
        Primary <-0.905504,-0.424325,0.00331555>
        Secondary <0.0710129,-0.143828,0.987052>
        Geometry Scaled { 
            Scale <2.88749,2.88749,2.88749>
            Geometry leaf

        }
    }
}

Texture2D APPID_1224_171714744 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <107.938,0>
    }
}

Shape SHAPEID_1224_200401648 { 
    Id  1224
    ParentId  1224
    Geometry  GEOMID_1224_200401524
    Appearance  APPID_1224_171714744
}

Translated GEOMID_1228_194874940 { 
    Translation <0.0250717,-0.119369,49.6851>
    Geometry Oriented { 
        Primary <-0.660602,-0.315732,0.681115>
        Secondary <0.424132,-0.905561,-0.00841672>
        Geometry Cylinder { 
            Radius 0.214055
            Solid False
        }
    }
}

Shape SHAPEID_1228_192854520 { 
    Id  1228
    ParentId  1222
    Geometry  GEOMID_1228_194874940
    Appearance  APPID_6_201601160
}

Translated GEOMID_1229_197349604 { 
    Translation <0.644521,0.163953,50.4173>
    Geometry Oriented { 
        Primary <-0.683337,-0.326131,0.653214>
        Secondary <0.424413,-0.905433,-0.00807194>
        Geometry Cylinder { 
            Radius 0.214055
            Height 0.5
            Solid False
        }
    }
}

Shape SHAPEID_1229_192854560 { 
    Id  1229
    ParentId  1228
    Geometry  GEOMID_1229_197349604
    Appearance  Color_3
}

Translated GEOMID_1230_209558436 { 
    Translation <0.941558,0.299812,50.7958>
    Geometry Oriented { 
        Primary <-0.703779,-0.336149,0.625858>
        Secondary <0.434555,-0.900632,0.00492764>
        Geometry Cylinder { 
            Radius 0.214055
            Height 0.173308
            Solid False
        }
    }
}

Shape SHAPEID_1230_197349712 { 
    Id  1230
    ParentId  1229
    Geometry  GEOMID_1230_209558436
    Appearance  APPID_3_195328248
}

Translated GEOMID_1232_209558724 { 
    Translation <1.0067,0.162184,51.0331>
    Geometry Oriented { 
        Primary <0.804049,-0.408965,-0.431571>
        Secondary <0.576335,0.357741,0.734751>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.0866541
            Solid False
        }
    }
}

Shape SHAPEID_1232_199769528 { 
    Id  1232
    ParentId  1230
    Geometry  GEOMID_1232_209558724
    Appearance  APPID_5_196508344
}

Translated GEOMID_1232_199769836 { 
    Translation <0.994041,0.0894371,51.0784>
    Geometry Oriented { 
        Primary <0.804049,-0.408965,-0.431571>
        Secondary <0.576335,0.357741,0.734751>
        Geometry Scaled { 
            Scale <0.43327,0.43327,0.43327>
            Geometry leaf

        }
    }
}

Shape SHAPEID_1232_199769864 { 
    Id  1232
    ParentId  1232
    Geometry  GEOMID_1232_199769836
    Appearance  APPID_5_196508344
}

Translated GEOMID_1236_192736812 { 
    Translation <1.0067,0.162184,51.0331>
    Geometry Oriented { 
        Primary <0.974073,-0.0477411,0.221137>
        Secondary <0.150702,0.865962,-0.476864>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1236_192736840 { 
    Id  1236
    ParentId  1230
    Geometry  GEOMID_1236_192736812
    Appearance  Default
}

Translated GEOMID_1238_208416388 { 
    Translation <1.03896,0.347547,50.931>
    Geometry Oriented { 
        Primary <0.826075,-0.353951,-0.438542>
        Secondary <0.167752,0.897326,-0.408248>
        Geometry Frustum { 
            Radius 0.214055
            Height 0.5
            Taper 0.969834
            Solid False
        }
    }
}

Shape SHAPEID_1238_208416416 { 
    Id  1238
    ParentId  1230
    Geometry  GEOMID_1238_208416388
    Appearance  Color_3
}

Translated GEOMID_1239_208416780 { 
    Translation <1.30797,0.479386,51.3313>
    Geometry Oriented { 
        Primary <0.838348,-0.348262,-0.419387>
        Secondary <0.188149,0.906904,-0.376994>
        Geometry Cylinder { 
            Radius 0.207598
            Height 1.35545
            Solid False
        }
    }
}

Texture2D APPID_1239_195368728 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_1239_208416536 { 
    Id  1239
    ParentId  1238
    Geometry  GEOMID_1239_208416780
    Appearance  APPID_1239_195368728
}

Translated GEOMID_1241_200225668 { 
    Translation <2.15772,0.896858,52.3534>
    Geometry Oriented { 
        Primary <-0.501422,0.863046,0.0610511>
        Secondary <0.353499,0.139953,0.924906>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.677726
            Solid False
        }
    }
}

Texture2D APPID_1241_191730232 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_1241_200225792 { 
    Id  1241
    ParentId  1239
    Geometry  GEOMID_1241_200225668
    Appearance  APPID_1241_191730232
}

Translated GEOMID_1241_209122468 { 
    Translation <2.69291,1.22579,52.0991>
    Geometry Oriented { 
        Primary <-0.501422,0.863046,0.0610511>
        Secondary <0.353499,0.139953,0.924906>
        Geometry Scaled { 
            Scale <3.38863,3.38863,3.38863>
            Geometry leaf

        }
    }
}

Texture2D APPID_1241_201802256 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_1241_209122592 { 
    Id  1241
    ParentId  1241
    Geometry  GEOMID_1241_209122468
    Appearance  APPID_1241_201802256
}

Translated GEOMID_1245_171946132 { 
    Translation <2.15772,0.896858,52.3534>
    Geometry Oriented { 
        Primary <-0.0448473,0.74595,0.66449>
        Secondary <-0.752668,-0.462594,0.468505>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1245_171946160 { 
    Id  1245
    ParentId  1239
    Geometry  GEOMID_1245_171946132
    Appearance  Default
}

Translated GEOMID_1247_209122748 { 
    Translation <2.00147,0.800825,52.4507>
    Geometry Oriented { 
        Primary <-0.492473,0.868766,0.0521144>
        Secondary <-0.711785,-0.436497,0.550302>
        Geometry Cylinder { 
            Radius 0.200827
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_1247_192472488 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_1247_171946240 { 
    Id  1247
    ParentId  1239
    Geometry  GEOMID_1247_209122748
    Appearance  APPID_1247_192472488
}

Translated GEOMID_1249_209042548 { 
    Translation <2.57797,1.19989,53.7866>
    Geometry Oriented { 
        Primary <-0.0841794,-0.945805,0.313636>
        Secondary <0.584843,0.207941,0.784041>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1249_201792744 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_1249_209042672 { 
    Id  1249
    ParentId  1247
    Geometry  GEOMID_1249_209042548
    Appearance  APPID_1249_201792744
}

Translated GEOMID_1249_208156084 { 
    Translation <1.97895,1.38509,54.1844>
    Geometry Oriented { 
        Primary <-0.0841794,-0.945805,0.313636>
        Secondary <0.584843,0.207941,0.784041>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_1249_197425840 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_1249_208156208 { 
    Id  1249
    ParentId  1249
    Geometry  GEOMID_1249_208156084
    Appearance  APPID_1249_197425840
}

Translated GEOMID_1253_171946436 { 
    Translation <2.57797,1.19989,53.7866>
    Geometry Oriented { 
        Primary <0.314138,-0.509417,0.801131>
        Secondary <0.832707,-0.257448,-0.490223>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1253_194577248 { 
    Id  1253
    ParentId  1247
    Geometry  GEOMID_1253_171946436
    Appearance  Default
}

Translated GEOMID_1255_208156364 { 
    Translation <2.7452,1.14819,53.6882>
    Geometry Oriented { 
        Primary <-0.126151,-0.939521,0.318412>
        Secondary <0.8768,-0.255736,-0.40721>
        Geometry Cylinder { 
            Radius 0.200827
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_1255_196501672 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_1255_194577368 { 
    Id  1255
    ParentId  1247
    Geometry  GEOMID_1255_208156364
    Appearance  APPID_1255_196501672
}

Translated GEOMID_1257_208417988 { 
    Translation <3.54738,1.32055,54.9589>
    Geometry Oriented { 
        Primary <0.731853,0.45172,-0.510235>
        Secondary <0.385962,0.342309,0.856655>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1257_208121728 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_1257_208418112 { 
    Id  1257
    ParentId  1255
    Geometry  GEOMID_1257_208417988
    Appearance  APPID_1257_208121728
}

Translated GEOMID_1257_193971060 { 
    Translation <3.96438,0.708824,55.0155>
    Geometry Oriented { 
        Primary <0.731853,0.45172,-0.510235>
        Secondary <0.385962,0.342309,0.856655>
        Geometry Scaled { 
            Scale <3.7125,3.7125,3.7125>
            Geometry leaf

        }
    }
}

Texture2D APPID_1257_193932064 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_1257_208418384 { 
    Id  1257
    ParentId  1257
    Geometry  GEOMID_1257_193971060
    Appearance  APPID_1257_193932064
}

Translated GEOMID_1261_193884876 { 
    Translation <3.54738,1.32055,54.9589>
    Geometry Oriented { 
        Primary <0.801289,0.545511,0.245669>
        Secondary <-0.563261,0.826275,0.00241373>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1261_193971456 { 
    Id  1261
    ParentId  1255
    Geometry  GEOMID_1261_193884876
    Appearance  Default
}

Translated GEOMID_1263_194577500 { 
    Translation <3.43426,1.48649,54.9594>
    Geometry Oriented { 
        Primary <0.697778,0.525507,-0.486773>
        Secondary <-0.555471,0.826033,0.0955073>
        Geometry Cylinder { 
            Radius 0.193697
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_1263_201351208 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <9.59444,0>
    }
}

Shape SHAPEID_1263_193884952 { 
    Id  1263
    ParentId  1255
    Geometry  GEOMID_1263_194577500
    Appearance  APPID_1263_201351208
}

Translated GEOMID_1265_206492532 { 
    Translation <4.11812,1.97957,56.2161>
    Geometry Oriented { 
        Primary <-0.894661,0.0937347,0.436801>
        Secondary <0.442161,0.0460848,0.895751>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1265_196359968 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <9.59444,0>
    }
}

Shape SHAPEID_1265_182374296 { 
    Id  1265
    ParentId  1263
    Geometry  GEOMID_1265_206492532
    Appearance  APPID_1265_196359968
}

Translated GEOMID_1265_182374564 { 
    Translation <4.16552,2.71801,56.1547>
    Geometry Oriented { 
        Primary <-0.894661,0.0937347,0.436801>
        Secondary <0.442161,0.0460848,0.895751>
        Geometry Scaled { 
            Scale <3.69377,3.69377,3.69377>
            Geometry leaf

        }
    }
}

Texture2D APPID_1265_201091848 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <9.59444,0>
    }
}

Shape SHAPEID_1265_195296312 { 
    Id  1265
    ParentId  1265
    Geometry  GEOMID_1265_182374564
    Appearance  APPID_1265_201091848
}

Translated GEOMID_1269_195296588 { 
    Translation <4.11812,1.97957,56.2161>
    Geometry Oriented { 
        Primary <-0.314739,0.180305,0.931896>
        Secondary <-0.0631312,-0.983595,0.168986>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1269_195296616 { 
    Id  1269
    ParentId  1263
    Geometry  GEOMID_1269_195296588
    Appearance  Default
}

Translated GEOMID_1271_193885084 { 
    Translation <4.10589,1.78905,56.2488>
    Geometry Oriented { 
        Primary <-0.899556,0.165833,0.404102>
        Secondary <-0.0603238,-0.96343,0.261083>
        Geometry Cylinder { 
            Radius 0.186153
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_1271_202225656 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <11.9931,0>
    }
}

Shape SHAPEID_1271_202086728 { 
    Id  1271
    ParentId  1263
    Geometry  GEOMID_1271_193885084
    Appearance  APPID_1271_202225656
}

Translated GEOMID_1273_202086948 { 
    Translation <4.63057,1.99359,57.6461>
    Geometry Oriented { 
        Primary <0.61326,-0.781595,-0.114108>
        Secondary <0.499029,0.2714,0.822989>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1273_199873024 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <11.9931,0>
    }
}

Shape SHAPEID_1273_202087072 { 
    Id  1273
    ParentId  1271
    Geometry  GEOMID_1273_202086948
    Appearance  APPID_1273_199873024
}

Translated GEOMID_1273_200930756 { 
    Translation <4.17596,1.57657,58.0593>
    Geometry Oriented { 
        Primary <0.61326,-0.781595,-0.114108>
        Secondary <0.499029,0.2714,0.822989>
        Geometry Scaled { 
            Scale <3.63007,3.63007,3.63007>
            Geometry leaf

        }
    }
}

Texture2D APPID_1273_196777768 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <11.9931,0>
    }
}

Shape SHAPEID_1273_200930880 { 
    Id  1273
    ParentId  1273
    Geometry  GEOMID_1273_200930756
    Appearance  APPID_1273_196777768
}

Translated GEOMID_1277_208189524 { 
    Translation <4.63057,1.99359,57.6461>
    Geometry Oriented { 
        Primary <0.767121,-0.378546,0.517907>
        Secondary <0.632616,0.580309,-0.512872>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1277_208189552 { 
    Id  1277
    ParentId  1271
    Geometry  GEOMID_1277_208189524
    Appearance  Default
}

Translated GEOMID_1279_202289892 { 
    Translation <4.74834,2.10162,57.5507>
    Geometry Oriented { 
        Primary <0.625069,-0.771914,-0.115922>
        Secondary <0.669291,0.606436,-0.429284>
        Geometry Cylinder { 
            Radius 0.178124
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_1279_199802016 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <14.3917,0>
    }
}

Shape SHAPEID_1279_208189632 { 
    Id  1279
    ParentId  1271
    Geometry  GEOMID_1279_202289892
    Appearance  APPID_1279_199802016
}

Translated GEOMID_1281_192881332 { 
    Translation <5.51405,2.37113,58.8269>
    Geometry Oriented { 
        Primary <0.0319893,0.975513,-0.217603>
        Secondary <0.223573,0.205214,0.952839>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1281_206402416 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <14.3917,0>
    }
}

Shape SHAPEID_1281_192881456 { 
    Id  1281
    ParentId  1279
    Geometry  GEOMID_1281_192881332
    Appearance  APPID_1281_206402416
}

Translated GEOMID_1281_201521100 { 
    Translation <6.23737,2.31238,58.6699>
    Geometry Oriented { 
        Primary <0.0319893,0.975513,-0.217603>
        Secondary <0.223573,0.205214,0.952839>
        Geometry Scaled { 
            Scale <3.37043,3.37043,3.37043>
            Geometry leaf

        }
    }
}

Texture2D APPID_1281_193781664 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <14.3917,0>
    }
}

Shape SHAPEID_1281_201521224 { 
    Id  1281
    ParentId  1281
    Geometry  GEOMID_1281_201521100
    Appearance  APPID_1281_193781664
}

Translated GEOMID_1285_200300436 { 
    Translation <5.51405,2.37113,58.8269>
    Geometry Oriented { 
        Primary <0.228797,0.830994,0.507052>
        Secondary <-0.950104,0.0771765,0.302234>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1285_200300464 { 
    Id  1285
    ParentId  1279
    Geometry  GEOMID_1285_200300436
    Appearance  Default
}

Translated GEOMID_1287_201521420 { 
    Translation <5.34481,2.38488,58.8808>
    Geometry Oriented { 
        Primary <-0.00434906,0.980783,-0.195054>
        Secondary <-0.917289,0.0737589,0.391331>
        Geometry Cylinder { 
            Radius 0.178124
            Height 1.485
            Solid False
        }
    }
}

Texture2D APPID_1287_194160560 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <16.7903,0>
    }
}

Shape SHAPEID_1287_200300544 { 
    Id  1287
    ParentId  1279
    Geometry  GEOMID_1287_201521420
    Appearance  APPID_1287_194160560
}

Translated GEOMID_1289_199192548 { 
    Translation <5.81681,2.77907,60.2566>
    Geometry Oriented { 
        Primary <-0.578364,-0.713539,0.39542>
        Secondary <0.482232,0.0919178,0.871208>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1289_193892736 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <16.7903,0>
    }
}

Shape SHAPEID_1289_199192672 { 
    Id  1289
    ParentId  1287
    Geometry  GEOMID_1289_199192548
    Appearance  APPID_1289_193892736
}

Translated GEOMID_1289_199687404 { 
    Translation <5.32825,3.29478,60.4726>
    Geometry Oriented { 
        Primary <-0.578364,-0.713539,0.39542>
        Secondary <0.482232,0.0919178,0.871208>
        Geometry Scaled { 
            Scale <2.56155,2.56155,2.56155>
            Geometry leaf

        }
    }
}

Texture2D APPID_1289_200964824 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <16.7903,0>
    }
}

Shape SHAPEID_1289_199687528 { 
    Id  1289
    ParentId  1289
    Geometry  GEOMID_1289_199687404
    Appearance  APPID_1289_200964824
}

Translated GEOMID_1293_199687772 { 
    Translation <5.81681,2.77907,60.2566>
    Geometry Oriented { 
        Primary <-0.10972,-0.395488,0.911894>
        Secondary <0.669928,-0.707164,-0.22609>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1293_199687800 { 
    Id  1293
    ParentId  1287
    Geometry  GEOMID_1293_199687772
    Appearance  Default
}

Translated GEOMID_1295_208457484 { 
    Translation <5.93614,2.6531,60.2163>
    Geometry Oriented { 
        Primary <-0.624467,-0.677258,0.389054>
        Secondary <0.688831,-0.712351,-0.134412>
        Geometry Cylinder { 
            Radius 0.169515
            Height 1.31394
            Solid False
        }
    }
}

Texture2D APPID_1295_201556592 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <19.1889,0>
    }
}

Shape SHAPEID_1295_194684816 { 
    Id  1295
    ParentId  1287
    Geometry  GEOMID_1295_208457484
    Appearance  APPID_1295_201556592
}

Translated GEOMID_1297_194685116 { 
    Translation <6.43427,2.73071,61.4532>
    Geometry Oriented { 
        Primary <0.93022,-0.0327675,-0.365536>
        Secondary <0.357442,0.306738,0.882126>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1297_191195408 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <19.1889,0>
    }
}

Shape SHAPEID_1297_194685240 { 
    Id  1297
    ParentId  1295
    Geometry  GEOMID_1297_194685116
    Appearance  APPID_1297_191195408
}

Translated GEOMID_1297_193611924 { 
    Translation <6.49606,2.02442,61.6738>
    Geometry Oriented { 
        Primary <0.93022,-0.0327675,-0.365536>
        Secondary <0.357442,0.306738,0.882126>
        Geometry Scaled { 
            Scale <1.27595,1.27595,1.27595>
            Geometry leaf

        }
    }
}

Texture2D APPID_1297_172644640 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <19.1889,0>
    }
}

Shape SHAPEID_1297_193612048 { 
    Id  1297
    ParentId  1297
    Geometry  GEOMID_1297_193611924
    Appearance  APPID_1297_172644640
}

Translated GEOMID_1301_193073172 { 
    Translation <6.43427,2.73071,61.4532>
    Geometry Oriented { 
        Primary <0.912662,0.169184,0.372055>
        Secondary <-0.0847612,0.968861,-0.232647>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1301_193073200 { 
    Id  1301
    ParentId  1295
    Geometry  GEOMID_1301_193073172
    Appearance  Default
}

Translated GEOMID_1303_200469356 { 
    Translation <6.4199,2.89494,61.4138>
    Geometry Oriented { 
        Primary <0.93279,0.0212373,-0.359795>
        Secondary <-0.0767913,0.987052,-0.140824>
        Geometry Cylinder { 
            Radius 0.160201
            Height 0.943229
            Solid False
        }
    }
}

Texture2D APPID_1303_195231480 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <21.5875,0>
    }
}

Shape SHAPEID_1303_193073328 { 
    Id  1303
    ParentId  1295
    Geometry  GEOMID_1303_200469356
    Appearance  APPID_1303_195231480
}

Translated GEOMID_1305_200097196 { 
    Translation <6.84678,3.16746,62.2429>
    Geometry Oriented { 
        Primary <-0.759693,0.625193,0.178883>
        Secondary <0.243234,0.0180779,0.969799>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1305_199877416 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <21.5875,0>
    }
}

Shape SHAPEID_1305_200097320 { 
    Id  1305
    ParentId  1303
    Geometry  GEOMID_1305_200097196
    Appearance  APPID_1305_199877416
}

Translated GEOMID_1305_191740804 { 
    Translation <7.29456,3.74681,62.1198>
    Geometry Oriented { 
        Primary <-0.759693,0.625193,0.178883>
        Secondary <0.243234,0.0180779,0.969799>
        Geometry Scaled { 
            Scale <0.467066,0.467066,0.467066>
            Geometry leaf

        }
    }
}

Texture2D APPID_1305_196016368 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <21.5875,0>
    }
}

Shape SHAPEID_1305_200097544 { 
    Id  1305
    ParentId  1305
    Geometry  GEOMID_1305_191740804
    Appearance  APPID_1305_196016368
}

Translated GEOMID_1309_194741044 { 
    Translation <6.84678,3.16746,62.2429>
    Geometry Oriented { 
        Primary <-0.320184,0.513093,0.796378>
        Secondary <-0.5913,-0.765022,0.255158>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1309_194741072 { 
    Id  1309
    ParentId  1303
    Geometry  GEOMID_1309_194741044
    Appearance  Default
}

Translated GEOMID_1311_208457276 { 
    Translation <6.75205,3.04491,62.2837>
    Geometry Oriented { 
        Primary <-0.742698,0.649716,0.162075>
        Secondary <-0.573935,-0.742325,0.345762>
        Geometry Cylinder { 
            Radius 0.15
            Height 0.435931
            Solid False
        }
    }
}

Texture2D APPID_1311_209043080 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <23.9861,0>
    }
}

Shape SHAPEID_1311_191741152 { 
    Id  1311
    ParentId  1303
    Geometry  GEOMID_1311_208457276
    Appearance  APPID_1311_209043080
}

Translated GEOMID_1313_200898556 { 
    Translation <6.76719,3.10046,62.7496>
    Geometry Oriented { 
        Primary <0.172732,-0.979017,0.108119>
        Secondary <0.449471,0.17602,0.875781>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1313_197306072 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <23.9861,0>
    }
}

Shape SHAPEID_1313_199926792 { 
    Id  1313
    ParentId  1311
    Geometry  GEOMID_1313_200898556
    Appearance  APPID_1313_197306072
}

Translated GEOMID_1313_199927140 { 
    Translation <6.11644,3.02422,63.0989>
    Geometry Oriented { 
        Primary <0.172732,-0.979017,0.108119>
        Secondary <0.449471,0.17602,0.875781>
        Geometry Scaled { 
            Scale <0.207431,0.207431,0.207431>
            Geometry leaf

        }
    }
}

Texture2D APPID_1313_203896408 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <23.9861,0>
    }
}

Shape SHAPEID_1313_199927264 { 
    Id  1313
    ParentId  1313
    Geometry  GEOMID_1313_199927140
    Appearance  APPID_1313_203896408
}

Translated GEOMID_1317_202428124 { 
    Translation <6.76719,3.10046,62.7496>
    Geometry Oriented { 
        Primary <0.400075,-0.572477,0.715688>
        Secondary <0.901587,0.105626,-0.419504>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1317_202428152 { 
    Id  1317
    ParentId  1311
    Geometry  GEOMID_1317_202428124
    Appearance  Default
}

Translated GEOMID_1319_199209156 { 
    Translation <6.90243,3.1163,62.6866>
    Geometry Oriented { 
        Primary <0.157955,-0.981451,0.108645>
        Secondary <0.93651,0.114016,-0.331587>
        Geometry Cylinder { 
            Radius 0.15
            Height 0.158856
            Solid False
        }
    }
}

Texture2D APPID_1319_193918464 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <26.3847,0>
    }
}

Shape SHAPEID_1319_199209280 { 
    Id  1319
    ParentId  1311
    Geometry  GEOMID_1319_199209156
    Appearance  APPID_1319_193918464
}

Translated GEOMID_1321_200976028 { 
    Translation <7.07309,3.05295,62.8228>
    Geometry Oriented { 
        Primary <0.558464,0.769962,-0.308668>
        Secondary <0.182934,0.248626,0.951168>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1321_199739272 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <26.3847,0>
    }
}

Shape SHAPEID_1321_200976152 { 
    Id  1321
    ParentId  1319
    Geometry  GEOMID_1321_200976028
    Appearance  APPID_1321_199739272
}

Translated GEOMID_1321_193891540 { 
    Translation <7.67385,2.61662,62.8213>
    Geometry Oriented { 
        Primary <0.558464,0.769962,-0.308668>
        Secondary <0.182934,0.248626,0.951168>
        Geometry Scaled { 
            Scale <0.143727,0.143727,0.143727>
            Geometry leaf

        }
    }
}

Texture2D APPID_1321_192472168 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <26.3847,0>
    }
}

Shape SHAPEID_1321_200976376 { 
    Id  1321
    ParentId  1321
    Geometry  GEOMID_1321_193891540
    Appearance  APPID_1321_192472168
}

Translated GEOMID_1325_194038060 { 
    Translation <7.07309,3.05295,62.8228>
    Geometry Oriented { 
        Primary <0.554639,0.698177,0.452685>
        Secondary <-0.806202,0.585549,0.0846804>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1325_194038088 { 
    Id  1325
    ParentId  1319
    Geometry  GEOMID_1325_194038060
    Appearance  Default
}

Translated GEOMID_1327_194038316 { 
    Translation <7.07309,3.05295,62.8228>
    Geometry Oriented { 
        Primary <0.537816,0.784959,-0.30756>
        Secondary <-0.806202,0.585549,0.0846804>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1327_193891888 { 
    Id  1327
    ParentId  1319
    Geometry  GEOMID_1327_194038316
    Appearance  Default
}

Translated GEOMID_1329_194741204 { 
    Translation <0.0250717,-0.119369,49.6851>
    Geometry Oriented { 
        Primary <-0.90572,-0.423865,0.00319096>
        Secondary <0.423877,-0.905682,0.00825181>
        Geometry Cylinder { 
            Radius 0.268098
            Height 1.5
            Solid False
        }
    }
}

Texture2D APPID_1329_209050144 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <110.336,0>
    }
}

Shape SHAPEID_1329_208890440 { 
    Id  1329
    ParentId  1222
    Geometry  GEOMID_1329_194741204
    Appearance  APPID_1329_209050144
}

Translated GEOMID_1331_208890660 { 
    Translation <-0.0558066,-0.360977,51.2082>
    Geometry Oriented { 
        Primary <0.95428,-0.298897,0.00318087>
        Secondary <0.0447977,0.153529,0.987128>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.75
            Solid False
        }
    }
}

Texture2D APPID_1331_197876264 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <110.336,0>
    }
}

Shape SHAPEID_1331_199757160 { 
    Id  1331
    ParentId  1329
    Geometry  GEOMID_1331_208890660
    Appearance  APPID_1331_197876264
}

Translated GEOMID_1331_192088588 { 
    Translation <-0.27746,-1.06737,51.3281>
    Geometry Oriented { 
        Primary <0.95428,-0.298897,0.00318087>
        Secondary <0.0447977,0.153529,0.987128>
        Geometry Scaled { 
            Scale <3.75,3.75,3.75>
            Geometry leaf

        }
    }
}

Texture2D APPID_1331_192854600 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <110.336,0>
    }
}

Shape SHAPEID_1331_192088712 { 
    Id  1331
    ParentId  1331
    Geometry  GEOMID_1331_192088588
    Appearance  APPID_1331_192854600
}

Translated GEOMID_1335_193670212 { 
    Translation <-0.0558066,-0.360977,51.2082>
    Geometry Oriented { 
        Primary <0.690815,-0.152633,0.706738>
        Secondary <0.298275,0.950574,-0.0862602>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1335_192088872 { 
    Id  1335
    ParentId  1329
    Geometry  GEOMID_1335_193670212
    Appearance  Default
}

Translated GEOMID_1337_199756724 { 
    Translation <0.0241602,-0.106129,51.1851>
    Geometry Oriented { 
        Primary <0.954135,-0.299362,0.00306112>
        Secondary <0.299327,0.954111,0.00875267>
        Geometry Cylinder { 
            Radius 0.263526
            Height 1.0005
            Solid False
        }
    }
}

Texture2D APPID_1337_203216304 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <112.735,0>
    }
}

Shape SHAPEID_1337_193670280 { 
    Id  1337
    ParentId  1329
    Geometry  GEOMID_1337_199756724
    Appearance  APPID_1337_203216304
}

Translated GEOMID_1339_208413292 { 
    Translation <0.245797,0.0180202,52.2083>
    Geometry Oriented { 
        Primary <-0.501719,0.865023,0.00360927>
        Secondary <-0.136748,-0.0834335,0.987086>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.50025
            Solid False
        }
    }
}

Texture2D APPID_1339_201218136 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <112.735,0>
    }
}

Shape SHAPEID_1339_208413320 { 
    Id  1339
    ParentId  1337
    Geometry  GEOMID_1339_208413292
    Appearance  APPID_1339_201218136
}

Translated GEOMID_1339_206395188 { 
    Translation <0.673087,0.265517,52.2884>
    Geometry Oriented { 
        Primary <-0.501719,0.865023,0.00360927>
        Secondary <-0.136748,-0.0834335,0.987086>
        Geometry Scaled { 
            Scale <2.50125,2.50125,2.50125>
            Geometry leaf

        }
    }
}

Texture2D APPID_1339_172643528 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <112.735,0>
    }
}

Shape SHAPEID_1339_201681952 { 
    Id  1339
    ParentId  1339
    Geometry  GEOMID_1339_206395188
    Appearance  APPID_1339_172643528
}

Translated GEOMID_1343_201682228 { 
    Translation <0.245797,0.0180202,52.2083>
    Geometry Oriented { 
        Primary <-0.406252,0.578856,0.707026>
        Secondary <-0.862077,-0.499336,-0.0865267>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1343_201682256 { 
    Id  1343
    ParentId  1337
    Geometry  GEOMID_1343_201682228
    Appearance  Default
}

Translated GEOMID_1345_193670412 { 
    Translation <0.0186166,-0.113568,52.1855>
    Geometry Oriented { 
        Primary <-0.501241,0.865301,0.00347352>
        Secondary <-0.86526,-0.501252,0.00848517>
        Geometry Cylinder { 
            Radius 0.258833
            Height 0.264816
            Solid False
        }
    }
}

Texture2D APPID_1345_193701896 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <115.133,0>
    }
}

Shape SHAPEID_1345_208090408 { 
    Id  1345
    ParentId  1337
    Geometry  GEOMID_1345_193670412
    Appearance  APPID_1345_193701896
}

Translated GEOMID_1347_195966892 { 
    Translation <-0.230807,-0.0577885,52.4728>
    Geometry Oriented { 
        Primary <-0.214538,-0.976711,0.00313069>
        Secondary <0.157156,-0.0313559,0.987076>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.132408
            Solid False
        }
    }
}

Texture2D APPID_1347_195255632 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <115.133,0>
    }
}

Shape SHAPEID_1347_195967016 { 
    Id  1347
    ParentId  1345
    Geometry  GEOMID_1347_195966892
    Appearance  APPID_1347_195255632
}

Translated GEOMID_1347_201289292 { 
    Translation <-0.358446,-0.0296841,52.494>
    Geometry Oriented { 
        Primary <-0.214538,-0.976711,0.00313069>
        Secondary <0.157156,-0.0313559,0.987076>
        Geometry Scaled { 
            Scale <0.662039,0.662039,0.662039>
            Geometry leaf

        }
    }
}

Texture2D APPID_1347_207247520 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <115.133,0>
    }
}

Shape SHAPEID_1347_201289416 { 
    Id  1347
    ParentId  1347
    Geometry  GEOMID_1347_201289292
    Appearance  APPID_1347_207247520
}

Translated GEOMID_1351_196042556 { 
    Translation <-0.230807,-0.0577885,52.4728>
    Geometry Oriented { 
        Primary <-0.0915748,-0.701581,0.706681>
        Secondary <0.972937,-0.214227,-0.0866038>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1351_196042584 { 
    Id  1351
    ParentId  1345
    Geometry  GEOMID_1351_196042556
    Appearance  Default
}

Translated GEOMID_1353_201289572 { 
    Translation <0.021022,-0.113238,52.4503>
    Geometry Oriented { 
        Primary <-0.215009,-0.976607,0.00301298>
        Secondary <0.976574,-0.215026,-0.00817248>
        Geometry Cylinder { 
            Radius 0.258833
            Height 0.5
            Solid False
        }
    }
}

Shape SHAPEID_1353_196042808 { 
    Id  1353
    ParentId  1345
    Geometry  GEOMID_1353_201289572
    Appearance  Color_3
}

Translated GEOMID_1354_195632196 { 
    Translation <0.0253366,-0.112645,52.9503>
    Geometry Oriented { 
        Primary <-0.215007,-0.976608,0.00286233>
        Secondary <0.97658,-0.214975,0.0088165>
        Geometry Cylinder { 
            Radius 0.258833
            Height 0.456399
            Solid False
        }
    }
}

Texture2D APPID_1354_192558352 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <117.532,0>
    }
}

Shape SHAPEID_1354_196042928 { 
    Id  1354
    ParentId  1353
    Geometry  GEOMID_1354_195632196
    Appearance  APPID_1354_192558352
}

Translated GEOMID_1356_208149180 { 
    Translation <0.169901,-0.321518,53.4291>
    Geometry Oriented { 
        Primary <0.817953,0.575273,0.00379655>
        Secondary <-0.0951523,0.128778,0.987098>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.2282
            Solid False
        }
    }
}

Texture2D APPID_1356_199996952 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <117.532,0>
    }
}

Shape SHAPEID_1356_208149304 { 
    Id  1356
    ParentId  1354
    Geometry  GEOMID_1356_208149180
    Appearance  APPID_1356_199996952
}

Translated GEOMID_1356_193721404 { 
    Translation <0.299373,-0.505848,53.4656>
    Geometry Oriented { 
        Primary <0.817953,0.575273,0.00379655>
        Secondary <-0.0951523,0.128778,0.987098>
        Geometry Scaled { 
            Scale <1.07995,1.07995,1.07995>
            Geometry leaf

        }
    }
}

Texture2D APPID_1356_195937200 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <117.532,0>
    }
}

Shape SHAPEID_1356_193721528 { 
    Id  1356
    ParentId  1356
    Geometry  GEOMID_1356_193721404
    Appearance  APPID_1356_195937200
}

Translated GEOMID_1360_208675756 { 
    Translation <0.169901,-0.321518,53.4291>
    Geometry Oriented { 
        Primary <0.541136,0.455072,0.707164>
        Secondary <-0.572622,0.815249,-0.0864442>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1360_208675784 { 
    Id  1360
    ParentId  1354
    Geometry  GEOMID_1360_208675756
    Appearance  Default
}

Translated GEOMID_1362_195632396 { 
    Translation <0.0216877,-0.110504,53.4067>
    Geometry Oriented { 
        Primary <0.818287,0.574798,0.00365371>
        Secondary <-0.574806,0.818245,0.00856804>
        Geometry Cylinder { 
            Radius 0.263526
            Height 0.77593
            Solid False
        }
    }
}

Texture2D APPID_1362_182448344 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <119.931,0>
    }
}

Shape SHAPEID_1362_208675824 { 
    Id  1362
    ParentId  1354
    Geometry  GEOMID_1362_195632396
    Appearance  APPID_1362_182448344
}

Translated GEOMID_1364_208512340 { 
    Translation <0.0570666,0.142764,54.2055>
    Geometry Oriented { 
        Primary <-0.991699,0.128548,0.00305474>
        Secondary <-0.0176272,-0.159444,0.98705>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.387965
            Solid False
        }
    }
}

Texture2D APPID_1364_200416120 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <119.931,0>
    }
}

Shape SHAPEID_1364_208512464 { 
    Id  1364
    ParentId  1362
    Geometry  GEOMID_1364_208512340
    Appearance  APPID_1364_200416120
}

Translated GEOMID_1364_196488156 { 
    Translation <0.106482,0.522505,54.2677>
    Geometry Oriented { 
        Primary <-0.991699,0.128548,0.00305474>
        Secondary <-0.0176272,-0.159444,0.98705>
        Geometry Scaled { 
            Scale <1.53566,1.53566,1.53566>
            Geometry leaf

        }
    }
}

Texture2D APPID_1364_209542176 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <119.931,0>
    }
}

Shape SHAPEID_1364_196488280 { 
    Id  1364
    ParentId  1364
    Geometry  GEOMID_1364_196488156
    Appearance  APPID_1364_209542176
}

Translated GEOMID_1368_193756924 { 
    Translation <0.0231893,-0.117574,54.1826>
    Geometry Oriented { 
        Primary <-0.726973,0.0885572,0.680931>
        Secondary <-0.128699,-0.991648,-0.00843448>
        Geometry Cylinder { 
            Radius 0.169515
            Solid False
        }
    }
}

Shape SHAPEID_1368_208675920 { 
    Id  1368
    ParentId  1362
    Geometry  GEOMID_1368_193756924
    Appearance  APPID_6_201601160
}

Translated GEOMID_1369_193757212 { 
    Translation <0.697686,-0.211341,54.9149>
    Geometry Oriented { 
        Primary <-0.75172,0.0919975,0.653034>
        Secondary <-0.128393,-0.99169,-0.00808892>
        Geometry Cylinder { 
            Radius 0.169515
            Height 0.5
            Solid False
        }
    }
}

Shape SHAPEID_1369_208675960 { 
    Id  1369
    ParentId  1368
    Geometry  GEOMID_1369_193757212
    Appearance  Color_3
}

Translated GEOMID_1370_200274300 { 
    Translation <1.02112,-0.256303,55.2935>
    Geometry Oriented { 
        Primary <-0.77433,0.0945269,0.625681>
        Secondary <-0.117261,-0.993089,0.00491395>
        Geometry Cylinder { 
            Radius 0.169515
            Height 0.650264
            Solid False
        }
    }
}

Shape SHAPEID_1370_200274328 { 
    Id  1370
    ParentId  1369
    Geometry  GEOMID_1370_200274300
    Appearance  APPID_3_195328248
}

Translated GEOMID_1372_192772108 { 
    Translation <1.32505,-0.411632,55.8816>
    Geometry Oriented { 
        Primary <0.458612,-0.776863,-0.431462>
        Secondary <0.678137,-0.00782166,0.734894>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.365751
            Solid False
        }
    }
}

Shape SHAPEID_1372_192772136 { 
    Id  1372
    ParentId  1370
    Geometry  GEOMID_1372_192772108
    Appearance  APPID_5_196508344
}

Translated GEOMID_1372_192772444 { 
    Translation <1.115,-0.641916,56.073>
    Geometry Oriented { 
        Primary <0.458612,-0.776863,-0.431462>
        Secondary <0.678137,-0.00782166,0.734894>
        Geometry Scaled { 
            Scale <0.6716,0.6716,0.6716>
            Geometry leaf

        }
    }
}

Shape SHAPEID_1372_192772472 { 
    Id  1372
    ParentId  1372
    Geometry  GEOMID_1372_192772444
    Appearance  APPID_5_196508344
}

Translated GEOMID_1376_200786148 { 
    Translation <1.32505,-0.411632,55.8816>
    Geometry Oriented { 
        Primary <0.795916,-0.563503,0.22132>
        Secondary <0.592382,0.649461,-0.476744>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1376_200786176 { 
    Id  1376
    ParentId  1370
    Geometry  GEOMID_1376_200786148
    Appearance  Default
}

Translated GEOMID_1378_209068388 { 
    Translation <1.42547,-0.301538,55.8008>
    Geometry Oriented { 
        Primary <0.506431,-0.742575,-0.438304>
        Secondary <0.633638,0.665238,-0.394919>
        Geometry Cylinder { 
            Radius 0.160201
            Height 0.943229
            Solid False
        }
    }
}

Texture2D APPID_1378_197333224 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_1378_209068512 { 
    Id  1378
    ParentId  1370
    Geometry  GEOMID_1378_209068388
    Appearance  APPID_1378_197333224
}

Translated GEOMID_1380_209068756 { 
    Translation <2.11629,-0.376781,56.4831>
    Geometry Oriented { 
        Primary <0.0417793,0.997091,0.0637556>
        Secondary <0.399693,-0.0751622,0.913562>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1380_192734528 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_1380_196162920 { 
    Id  1380
    ParentId  1378
    Geometry  GEOMID_1380_209068756
    Appearance  APPID_1380_192734528
}

Translated GEOMID_1380_196163228 { 
    Translation <2.79619,-0.386199,56.1848>
    Geometry Oriented { 
        Primary <0.0417793,0.997091,0.0637556>
        Secondary <0.399693,-0.0751622,0.913562>
        Geometry Scaled { 
            Scale <0.467066,0.467066,0.467066>
            Geometry leaf

        }
    }
}

Texture2D APPID_1380_208713864 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_1380_196163352 { 
    Id  1380
    ParentId  1380
    Geometry  GEOMID_1380_196163228
    Appearance  APPID_1380_208713864
}

Translated GEOMID_1384_201337508 { 
    Translation <2.11629,-0.376781,56.4831>
    Geometry Oriented { 
        Primary <0.382546,0.650927,0.655708>
        Secondary <-0.868843,0.0120363,0.494942>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1384_201337536 { 
    Id  1384
    ParentId  1378
    Geometry  GEOMID_1384_201337508
    Appearance  Default
}

Translated GEOMID_1386_208305988 { 
    Translation <1.9771,-0.374852,56.5624>
    Geometry Oriented { 
        Primary <0.0529274,0.997142,0.0539079>
        Secondary <-0.817891,0.0123139,0.575242>
        Geometry Cylinder { 
            Radius 0.15
            Height 0.435931
            Solid False
        }
    }
}

Texture2D APPID_1386_200211448 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_1386_208306112 { 
    Id  1386
    ParentId  1378
    Geometry  GEOMID_1386_208305988
    Appearance  APPID_1386_200211448
}

Translated GEOMID_1388_208306332 { 
    Translation <2.14431,-0.307987,56.9944>
    Geometry Oriented { 
        Primary <-0.568539,-0.754585,0.327667>
        Secondary <0.626841,-0.139419,0.766572>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1388_194685280 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_1388_199885952 { 
    Id  1388
    ParentId  1386
    Geometry  GEOMID_1388_208306332
    Appearance  APPID_1388_194685280
}

Translated GEOMID_1388_199886260 { 
    Translation <1.74873,0.168119,57.4045>
    Geometry Oriented { 
        Primary <-0.568539,-0.754585,0.327667>
        Secondary <0.626841,-0.139419,0.766572>
        Geometry Scaled { 
            Scale <0.207431,0.207431,0.207431>
            Geometry leaf

        }
    }
}

Texture2D APPID_1388_200188912 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_1388_199886384 { 
    Id  1388
    ParentId  1388
    Geometry  GEOMID_1388_199886260
    Appearance  APPID_1388_200188912
}

Translated GEOMID_1392_193628052 { 
    Translation <2.14431,-0.307987,56.9944>
    Geometry Oriented { 
        Primary <0.0151441,-0.600764,0.799283>
        Secondary <0.550345,-0.662386,-0.508296>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1392_193628080 { 
    Id  1392
    ParentId  1386
    Geometry  GEOMID_1392_193628052
    Appearance  Default
}

Translated GEOMID_1394_193628436 { 
    Translation <2.22686,-0.407345,56.9182>
    Geometry Oriented { 
        Primary <-0.601791,-0.725716,0.333444>
        Secondary <0.590226,-0.685387,-0.426471>
        Geometry Cylinder { 
            Radius 0.15
            Height 0.158856
            Solid False
        }
    }
}

Texture2D APPID_1394_196246320 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_1394_206485680 { 
    Id  1394
    ParentId  1386
    Geometry  GEOMID_1394_193628436
    Appearance  APPID_1394_196246320
}

Translated GEOMID_1396_206485844 { 
    Translation <2.31663,-0.566786,57.0508>
    Geometry Oriented { 
        Primary <0.844926,-0.0146246,-0.534684>
        Secondary <0.534117,0.0765832,0.841935>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1396_194786344 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_1396_206485968 { 
    Id  1396
    ParentId  1394
    Geometry  GEOMID_1396_206485844
    Appearance  APPID_1396_194786344
}

Translated GEOMID_1396_193613252 { 
    Translation <2.3379,-1.30703,57.1046>
    Geometry Oriented { 
        Primary <0.844926,-0.0146246,-0.534684>
        Secondary <0.534117,0.0765832,0.841935>
        Geometry Scaled { 
            Scale <0.143727,0.143727,0.143727>
            Geometry leaf

        }
    }
}

Texture2D APPID_1396_192723064 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <7.19583,0>
    }
}

Shape SHAPEID_1396_193613376 { 
    Id  1396
    ParentId  1396
    Geometry  GEOMID_1396_193613252
    Appearance  APPID_1396_192723064
}

Translated GEOMID_1400_193613724 { 
    Translation <2.31663,-0.566786,57.0508>
    Geometry Oriented { 
        Primary <0.975623,0.0266555,0.217829>
        Secondary <-0.0287099,0.999568,0.00627129>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1400_193613752 { 
    Id  1400
    ParentId  1394
    Geometry  GEOMID_1400_193613724
    Appearance  Default
}

Translated GEOMID_1402_199696276 { 
    Translation <2.31663,-0.566786,57.0508>
    Geometry Oriented { 
        Primary <0.843713,0.0275968,-0.536085>
        Secondary <-0.0287099,0.999568,0.00627129>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1402_199696304 { 
    Id  1402
    ParentId  1394
    Geometry  GEOMID_1402_199696276
    Appearance  Default
}

Translated GEOMID_1404_208929276 { 
    Translation <0.0231893,-0.117574,54.1826>
    Geometry Oriented { 
        Primary <-0.991639,0.129012,0.00293995>
        Secondary <-0.128984,-0.991613,0.00823419>
        Geometry Cylinder { 
            Radius 0.217903
            Height 1.35543
            Solid False
        }
    }
}

Texture2D APPID_1404_195632504 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <122.329,0>
    }
}

Shape SHAPEID_1404_208929400 { 
    Id  1404
    ParentId  1362
    Geometry  GEOMID_1404_208929276
    Appearance  APPID_1404_195632504
}

Translated GEOMID_1406_209522972 { 
    Translation <-0.13751,-0.246819,55.5567>
    Geometry Oriented { 
        Primary <0.644367,-0.764709,0.00335189>
        Secondary <0.120022,0.105461,0.987154>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.731294
            Solid False
        }
    }
}

Texture2D APPID_1406_208512504 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <122.329,0>
    }
}

Shape SHAPEID_1406_194089976 { 
    Id  1406
    ParentId  1404
    Geometry  GEOMID_1406_209522972
    Appearance  APPID_1406_208512504
}

Translated GEOMID_1406_194090284 { 
    Translation <-0.689812,-0.711693,55.6735>
    Geometry Oriented { 
        Primary <0.644367,-0.764709,0.00335189>
        Secondary <0.120022,0.105461,0.987154>
        Geometry Scaled { 
            Scale <1.67116,1.67116,1.67116>
            Geometry leaf

        }
    }
}

Texture2D APPID_1406_195090928 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <122.329,0>
    }
}

Shape SHAPEID_1406_194090408 { 
    Id  1406
    ParentId  1406
    Geometry  GEOMID_1406_194090284
    Appearance  APPID_1406_195090928
}

Translated GEOMID_1410_193892076 { 
    Translation <0.0285807,-0.10702,55.538>
    Geometry Oriented { 
        Primary <0.475664,-0.556585,0.681144>
        Secondary <0.76484,0.644174,-0.00773529>
        Geometry Cylinder { 
            Radius 0.160201
            Solid False
        }
    }
}

Shape SHAPEID_1410_194090536 { 
    Id  1410
    ParentId  1404
    Geometry  GEOMID_1410_193892076
    Appearance  APPID_6_201601160
}

Translated GEOMID_1411_193892308 { 
    Translation <-0.40589,0.417625,56.2701>
    Geometry Oriented { 
        Primary <0.49161,-0.575841,0.653243>
        Secondary <0.764658,0.644393,-0.00741843>
        Geometry Cylinder { 
            Radius 0.160201
            Height 0.5
            Solid False
        }
    }
}

Shape SHAPEID_1411_194090576 { 
    Id  1411
    ParentId  1410
    Geometry  GEOMID_1411_193892308
    Appearance  Color_3
}

Translated GEOMID_1412_196244236 { 
    Translation <-0.614226,0.669203,56.6486>
    Geometry Oriented { 
        Primary <0.506595,-0.592982,0.625886>
        Secondary <0.757403,0.652924,0.00555339>
        Geometry Cylinder { 
            Radius 0.160201
            Height 0.256775
            Solid False
        }
    }
}

Shape SHAPEID_1412_193892664 { 
    Id  1412
    ParentId  1411
    Geometry  GEOMID_1412_196244236
    Appearance  APPID_3_195328248
}

Translated GEOMID_1414_201223436 { 
    Translation <-0.579793,0.802778,56.9254>
    Geometry Oriented { 
        Primary <0.186999,0.882678,-0.431173>
        Secondary <-0.495112,0.463777,0.734694>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.191095
            Solid False
        }
    }
}

Shape SHAPEID_1414_196244840 { 
    Id  1414
    ParentId  1412
    Geometry  GEOMID_1414_201223436
    Appearance  APPID_5_196508344
}

Translated GEOMID_1414_201223732 { 
    Translation <-0.417655,0.817319,57.0254>
    Geometry Oriented { 
        Primary <0.186999,0.882678,-0.431173>
        Secondary <-0.495112,0.463777,0.734694>
        Geometry Scaled { 
            Scale <0.204185,0.204185,0.204185>
            Geometry leaf

        }
    }
}

Shape SHAPEID_1414_201223760 { 
    Id  1414
    ParentId  1414
    Geometry  GEOMID_1414_201223732
    Appearance  APPID_5_196508344
}

Translated GEOMID_1418_201555292 { 
    Translation <-0.579793,0.802778,56.9254>
    Geometry Oriented { 
        Primary <-0.206214,0.953133,0.22139>
        Secondary <-0.875224,-0.0784914,-0.477307>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1418_201555320 { 
    Id  1418
    ParentId  1412
    Geometry  GEOMID_1418_201555292
    Appearance  Default
}

Translated GEOMID_1420_196244468 { 
    Translation <-0.720005,0.790204,56.8489>
    Geometry Oriented { 
        Primary <0.128633,0.889706,-0.438038>
        Secondary <-0.916351,-0.0622395,-0.395508>
        Geometry Cylinder { 
            Radius 0.15
            Height 0.169679
            Solid False
        }
    }
}

Texture2D APPID_1420_200747912 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_1420_196244592 { 
    Id  1420
    ParentId  1412
    Geometry  GEOMID_1420_196244468
    Appearance  APPID_1420_200747912
}

Translated GEOMID_1422_195159188 { 
    Translation <-0.879145,0.956355,56.9116>
    Geometry Oriented { 
        Primary <-0.704612,-0.706782,0.0630899>
        Secondary <-0.244441,0.325233,0.913494>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.2475
            Solid False
        }
    }
}

Texture2D APPID_1422_208306416 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_1422_195159312 { 
    Id  1422
    ParentId  1420
    Geometry  GEOMID_1422_195159188
    Appearance  APPID_1422_208306416
}

Translated GEOMID_1422_195159668 { 
    Translation <-1.04402,1.11184,56.8121>
    Geometry Oriented { 
        Primary <-0.704612,-0.706782,0.0630899>
        Secondary <-0.244441,0.325233,0.913494>
        Geometry Scaled { 
            Scale <0.150562,0.150562,0.150562>
            Geometry leaf

        }
    }
}

Texture2D APPID_1422_196163392 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <2.39861,0>
    }
}

Shape SHAPEID_1422_195159792 { 
    Id  1422
    ParentId  1422
    Geometry  GEOMID_1422_195159668
    Appearance  APPID_1422_196163392
}

Translated GEOMID_1426_208615644 { 
    Translation <-0.879145,0.956355,56.9116>
    Geometry Oriented { 
        Primary <-0.722256,-0.221536,0.655186>
        Secondary <0.632046,-0.596065,0.495201>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1426_208615672 { 
    Id  1426
    ParentId  1420
    Geometry  GEOMID_1426_208615644
    Appearance  Default
}

Translated GEOMID_1428_208615972 { 
    Translation <-0.784338,0.866945,56.9859>
    Geometry Oriented { 
        Primary <-0.712775,-0.699361,0.0533399>
        Secondary <0.594299,-0.561806,0.575485>
        Geometry Cylinder { 
            Radius 0.15
            Height 0.158856
            Solid False
        }
    }
}

Texture2D APPID_1428_200274088 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_1428_208616096 { 
    Id  1428
    ParentId  1420
    Geometry  GEOMID_1428_208615972
    Appearance  APPID_1428_200274088
}

Translated GEOMID_1430_199611716 { 
    Translation <-0.849826,0.808103,57.1917>
    Geometry Oriented { 
        Primary <0.928781,0.172155,0.328221>
        Secondary <-0.368383,0.52615,0.766459>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.7425
            Solid False
        }
    }
}

Texture2D APPID_1430_209166832 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_1430_199611840 { 
    Id  1430
    ParentId  1428
    Geometry  GEOMID_1430_199611716
    Appearance  APPID_1430_209166832
}

Translated GEOMID_1430_199612188 { 
    Translation <-0.880079,0.189761,57.6017>
    Geometry Oriented { 
        Primary <0.928781,0.172155,0.328221>
        Secondary <-0.368383,0.52615,0.766459>
        Geometry Scaled { 
            Scale <0.143727,0.143727,0.143727>
            Geometry leaf

        }
    }
}

Texture2D APPID_1430_199597264 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <4.79722,0>
    }
}

Shape SHAPEID_1430_199612312 { 
    Id  1430
    ParentId  1430
    Geometry  GEOMID_1430_199612188
    Appearance  APPID_1430_199597264
}

Translated GEOMID_1434_200200164 { 
    Translation <-0.849826,0.808103,57.1917>
    Geometry Oriented { 
        Primary <0.394265,0.452987,0.799599>
        Secondary <0.0420885,0.860264,-0.508108>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1434_200200192 { 
    Id  1434
    ParentId  1428
    Geometry  GEOMID_1434_200200164
    Appearance  Default
}

Translated GEOMID_1436_200200460 { 
    Translation <-0.849826,0.808103,57.1917>
    Geometry Oriented { 
        Primary <0.927935,0.154859,0.339052>
        Secondary <0.0420885,0.860264,-0.508108>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1436_200200488 { 
    Id  1436
    ParentId  1428
    Geometry  GEOMID_1436_200200460
    Appearance  Default
}

Translated GEOMID_1438_201555620 { 
    Translation <0.0285807,-0.10702,55.538>
    Geometry Oriented { 
        Primary <0.643974,-0.76504,0.00322561>
        Secondary <0.764995,0.643974,0.0089261>
        Geometry Cylinder { 
            Radius 0.160201
            Height 0.887548
            Solid False
        }
    }
}

Texture2D APPID_1438_195207488 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <124.728,0>
    }
}

Shape SHAPEID_1438_201555744 { 
    Id  1438
    ParentId  1404
    Geometry  GEOMID_1438_201555620
    Appearance  APPID_1438_195207488
}

Translated GEOMID_1440_199573404 { 
    Translation <0.180132,-0.116646,56.4394>
    Geometry Oriented { 
        Primary <0.0414827,0.999133,0.00360509>
        Secondary <-0.160374,0.00309703,0.987051>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.597833
            Solid False
        }
    }
}

Texture2D APPID_1440_177284656 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <124.728,0>
    }
}

Shape SHAPEID_1440_199573528 { 
    Id  1440
    ParentId  1438
    Geometry  GEOMID_1440_199573404
    Appearance  APPID_1440_177284656
}

Translated GEOMID_1440_199573876 { 
    Translation <0.769705,-0.14147,56.5353>
    Geometry Oriented { 
        Primary <0.0414827,0.999133,0.00360509>
        Secondary <-0.160374,0.00309703,0.987051>
        Geometry Scaled { 
            Scale <0.549031,0.549031,0.549031>
            Geometry leaf

        }
    }
}

Texture2D APPID_1440_200981344 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <124.728,0>
    }
}

Shape SHAPEID_1440_199574000 { 
    Id  1440
    ParentId  1440
    Geometry  GEOMID_1440_199573876
    Appearance  APPID_1440_200981344
}

Translated GEOMID_1444_193904836 { 
    Translation <0.180132,-0.116646,56.4394>
    Geometry Oriented { 
        Primary <-0.0318749,0.706486,0.707009>
        Secondary <-0.995348,0.0419096,-0.0867529>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1444_193904864 { 
    Id  1444
    ParentId  1438
    Geometry  GEOMID_1444_193904836
    Appearance  Default
}

Translated GEOMID_1446_209522588 { 
    Translation <0.0206762,-0.109932,56.4255>
    Geometry Oriented { 
        Primary <0.0420344,0.99911,0.00346961>
        Secondary <-0.999083,0.0420046,0.00825812>
        Geometry Cylinder { 
            Radius 0.15
            Height 0.286887
            Solid False
        }
    }
}

Texture2D APPID_1446_208204952 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/appletree_texture_sym.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <127.126,0>
    }
}

Shape SHAPEID_1446_209522712 { 
    Id  1446
    ParentId  1438
    Geometry  GEOMID_1446_209522588
    Appearance  APPID_1446_208204952
}

Translated GEOMID_1448_196088508 { 
    Translation <-0.0828352,-0.00552492,56.7253>
    Geometry Oriented { 
        Primary <-0.705637,-0.708567,0.00298219>
        Secondary <0.1155,-0.110868,0.987101>
        Geometry Cylinder { 
            Radius 0.025
            Height 0.338723
            Solid False
        }
    }
}

Texture2D APPID_1448_199221920 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <127.126,0>
    }
}

Shape SHAPEID_1448_196088632 { 
    Id  1448
    ParentId  1446
    Geometry  GEOMID_1448_196088508
    Appearance  APPID_1448_199221920
}

Translated GEOMID_1448_193905308 { 
    Translation <-0.319636,0.230525,56.7795>
    Geometry Oriented { 
        Primary <-0.705637,-0.708567,0.00298219>
        Secondary <0.1155,-0.110868,0.987101>
        Geometry Scaled { 
            Scale <0.183552,0.183552,0.183552>
            Geometry leaf

        }
    }
}

Texture2D APPID_1448_203269936 { 
    Image ImageTexture { 
        Filename "/home/cokelaer/Work/virtualplants/trunk/vplants/plantik/share/data/apple_leaf_texture.jpg"
    }
    Transformation Texture2DTransformation { 
        Translation <127.126,0>
    }
}

Shape SHAPEID_1448_193811832 { 
    Id  1448
    ParentId  1448
    Geometry  GEOMID_1448_193905308
    Appearance  APPID_1448_203269936
}

Translated GEOMID_1452_193812180 { 
    Translation <-0.0828352,-0.00552492,56.7253>
    Geometry Oriented { 
        Primary <-0.454274,-0.542561,0.706585>
        Secondary <0.705578,-0.703341,-0.0864428>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1452_193812208 { 
    Id  1452
    ParentId  1446
    Geometry  GEOMID_1452_193812180
    Appearance  Default
}

Translated GEOMID_1454_193812436 { 
    Translation <-0.0828352,-0.00552492,56.7253>
    Geometry Oriented { 
        Primary <-0.705795,-0.70841,0.00300984>
        Secondary <0.705578,-0.703341,-0.0864428>
        Geometry Scaled { 
            Scale <0.0666667,0.0666667,0.0666667>
            Geometry Sphere { 
                Radius 1
            }
        }
    }
}

Shape SHAPEID_1454_193812464 { 
    Id  1454
    ParentId  1446
    Geometry  GEOMID_1454_193812436
    Appearance  Default
}

