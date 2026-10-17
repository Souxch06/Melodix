.class public final Ly10;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final A:[B

.field public static final k:[I

.field public static final l:[I

.field public static final m:[B

.field public static final n:[B

.field public static final o:[B

.field public static final p:[Ljava/lang/String;

.field public static final q:[I

.field public static final r:[B

.field public static final s:Lw10;

.field public static final t:[[Lw10;

.field public static final u:[Lw10;

.field public static final v:[Ljava/util/HashMap;

.field public static final w:[Ljava/util/HashMap;

.field public static final x:Ljava/util/HashSet;

.field public static final y:Ljava/util/HashMap;

.field public static final z:Ljava/nio/charset/Charset;


# instance fields
.field public final a:Ljava/lang/String;

.field public b:I

.field public final c:[Ljava/util/HashMap;

.field public final d:Ljava/util/HashSet;

.field public e:Ljava/nio/ByteOrder;

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I


# direct methods
.method static constructor <clinit>()V
    .locals 134

    const/4 v0, 0x1

    .line 1
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x6

    .line 2
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/16 v6, 0x8

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v1, v3, v5, v7}, [Ljava/lang/Integer;

    move-result-object v3

    .line 3
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    const/4 v3, 0x2

    .line 4
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v9, 0x7

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/4 v11, 0x4

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/4 v13, 0x5

    .line 5
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    filled-new-array {v8, v10, v12, v14}, [Ljava/lang/Integer;

    move-result-object v12

    .line 6
    invoke-static {v12}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 7
    filled-new-array {v6, v6, v6}, [I

    move-result-object v12

    sput-object v12, Ly10;->k:[I

    .line 8
    filled-new-array {v6}, [I

    move-result-object v12

    sput-object v12, Ly10;->l:[I

    .line 9
    new-array v12, v4, [B

    fill-array-data v12, :array_0

    sput-object v12, Ly10;->m:[B

    .line 10
    new-array v12, v2, [B

    fill-array-data v12, :array_1

    sput-object v12, Ly10;->n:[B

    const/16 v12, 0xa

    .line 11
    new-array v15, v12, [B

    fill-array-data v15, :array_2

    sput-object v15, Ly10;->o:[B

    .line 12
    const-string v27, "SINGLE"

    const-string v28, "DOUBLE"

    const-string v16, ""

    const-string v17, "BYTE"

    const-string v18, "STRING"

    const-string v19, "USHORT"

    const-string v20, "ULONG"

    const-string v21, "URATIONAL"

    const-string v22, "SBYTE"

    const-string v23, "UNDEFINED"

    const-string v24, "SSHORT"

    const-string v25, "SLONG"

    const-string v26, "SRATIONAL"

    filled-new-array/range {v16 .. v28}, [Ljava/lang/String;

    move-result-object v15

    sput-object v15, Ly10;->p:[Ljava/lang/String;

    const/16 v15, 0xe

    .line 13
    new-array v0, v15, [I

    fill-array-data v0, :array_3

    sput-object v0, Ly10;->q:[I

    .line 14
    new-array v0, v6, [B

    fill-array-data v0, :array_4

    sput-object v0, Ly10;->r:[B

    .line 15
    new-instance v0, Lw10;

    const-string v15, "NewSubfileType"

    const/16 v6, 0xfe

    invoke-direct {v0, v15, v6, v11}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v6, Lw10;

    const-string v12, "SubfileType"

    const/16 v9, 0xff

    invoke-direct {v6, v12, v9, v11}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v9, Lw10;

    const-string v2, "ImageWidth"

    const/16 v11, 0x100

    invoke-direct {v9, v2, v11}, Lw10;-><init>(Ljava/lang/String;I)V

    new-instance v2, Lw10;

    const-string v11, "ImageLength"

    const/16 v13, 0x101

    invoke-direct {v2, v11, v13}, Lw10;-><init>(Ljava/lang/String;I)V

    new-instance v11, Lw10;

    const-string v13, "BitsPerSample"

    const/16 v3, 0x102

    invoke-direct {v11, v13, v3, v4}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v3, Lw10;

    move-object/from16 v17, v0

    const-string v0, "Compression"

    move-object/from16 v20, v2

    const/16 v2, 0x103

    invoke-direct {v3, v0, v2, v4}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lw10;

    move-object/from16 v22, v3

    const-string v3, "PhotometricInterpretation"

    move-object/from16 v18, v6

    const/16 v6, 0x106

    invoke-direct {v2, v3, v6, v4}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v6, Lw10;

    const-string v4, "ImageDescription"

    move-object/from16 v23, v2

    const/16 v2, 0x10e

    move-object/from16 v19, v9

    const/4 v9, 0x2

    invoke-direct {v6, v4, v2, v9}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lw10;

    move-object/from16 v24, v6

    const-string v6, "Make"

    move-object/from16 v21, v11

    const/16 v11, 0x10f

    invoke-direct {v2, v6, v11, v9}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v11, Lw10;

    move-object/from16 v25, v2

    const-string v2, "Model"

    move-object/from16 v62, v7

    const/16 v7, 0x110

    invoke-direct {v11, v2, v7, v9}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v9, Lw10;

    const-string v7, "StripOffsets"

    move-object/from16 v26, v11

    const/16 v11, 0x111

    invoke-direct {v9, v7, v11}, Lw10;-><init>(Ljava/lang/String;I)V

    new-instance v11, Lw10;

    move-object/from16 v27, v9

    const-string v9, "Orientation"

    move-object/from16 v63, v10

    const/16 v10, 0x112

    move-object/from16 v64, v5

    const/4 v5, 0x3

    invoke-direct {v11, v9, v10, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    move-object/from16 v28, v11

    const-string v11, "SamplesPerPixel"

    move-object/from16 v65, v8

    const/16 v8, 0x115

    invoke-direct {v10, v11, v8, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v8, "RowsPerStrip"

    move-object/from16 v29, v10

    const/16 v10, 0x116

    invoke-direct {v5, v8, v10}, Lw10;-><init>(Ljava/lang/String;I)V

    new-instance v10, Lw10;

    move-object/from16 v30, v5

    const-string v5, "StripByteCounts"

    move-object/from16 v66, v1

    const/16 v1, 0x117

    invoke-direct {v10, v5, v1}, Lw10;-><init>(Ljava/lang/String;I)V

    new-instance v1, Lw10;

    move-object/from16 v31, v10

    const-string v10, "XResolution"

    move-object/from16 v67, v14

    const/16 v14, 0x11a

    move-object/from16 v68, v5

    const/4 v5, 0x5

    invoke-direct {v1, v10, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v14, Lw10;

    move-object/from16 v32, v1

    const-string v1, "YResolution"

    move-object/from16 v69, v10

    const/16 v10, 0x11b

    invoke-direct {v14, v1, v10, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v10, "PlanarConfiguration"

    move-object/from16 v33, v14

    const/16 v14, 0x11c

    move-object/from16 v70, v1

    const/4 v1, 0x3

    invoke-direct {v5, v10, v14, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "ResolutionUnit"

    move-object/from16 v34, v5

    const/16 v5, 0x128

    invoke-direct {v10, v14, v5, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v14, "TransferFunction"

    move-object/from16 v35, v10

    const/16 v10, 0x12d

    invoke-direct {v5, v14, v10, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v10, "Software"

    const/16 v14, 0x131

    move-object/from16 v36, v5

    const/4 v5, 0x2

    invoke-direct {v1, v10, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "DateTime"

    move-object/from16 v37, v1

    const/16 v1, 0x132

    invoke-direct {v10, v14, v1, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v14, "Artist"

    move-object/from16 v38, v10

    const/16 v10, 0x13b

    invoke-direct {v1, v14, v10, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v10, "WhitePoint"

    const/16 v14, 0x13e

    move-object/from16 v39, v1

    const/4 v1, 0x5

    invoke-direct {v5, v10, v14, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "PrimaryChromaticities"

    move-object/from16 v40, v5

    const/16 v5, 0x13f

    invoke-direct {v10, v14, v5, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v5, "SubIFDPointer"

    const/16 v14, 0x14a

    move-object/from16 v41, v10

    const/4 v10, 0x4

    invoke-direct {v1, v5, v14, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v14, Lw10;

    move-object/from16 v42, v1

    const-string v1, "JPEGInterchangeFormat"

    move-object/from16 v71, v5

    const/16 v5, 0x201

    invoke-direct {v14, v1, v5, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v5, "JPEGInterchangeFormatLength"

    move-object/from16 v43, v14

    const/16 v14, 0x202

    invoke-direct {v1, v5, v14, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v10, "YCbCrCoefficients"

    const/16 v14, 0x211

    move-object/from16 v44, v1

    const/4 v1, 0x5

    invoke-direct {v5, v10, v14, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v10, "YCbCrSubSampling"

    const/16 v14, 0x212

    move-object/from16 v45, v5

    const/4 v5, 0x3

    invoke-direct {v1, v10, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "YCbCrPositioning"

    move-object/from16 v46, v1

    const/16 v1, 0x213

    invoke-direct {v10, v14, v1, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v5, "ReferenceBlackWhite"

    const/16 v14, 0x214

    move-object/from16 v47, v10

    const/4 v10, 0x5

    invoke-direct {v1, v5, v14, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v10, "Copyright"

    const v14, 0x8298

    move-object/from16 v48, v1

    const/4 v1, 0x2

    invoke-direct {v5, v10, v14, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v10, "ExifIFDPointer"

    const v14, 0x8769

    move-object/from16 v49, v5

    const/4 v5, 0x4

    invoke-direct {v1, v10, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v14, Lw10;

    move-object/from16 v50, v1

    const-string v1, "GPSInfoIFDPointer"

    move-object/from16 v72, v10

    const v10, 0x8825

    invoke-direct {v14, v1, v10, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    move-object/from16 v51, v14

    const-string v14, "SensorTopBorder"

    invoke-direct {v10, v14, v5, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v14, Lw10;

    move-object/from16 v52, v10

    const-string v10, "SensorLeftBorder"

    move-object/from16 v73, v1

    const/4 v1, 0x5

    invoke-direct {v14, v10, v1, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v10, "SensorBottomBorder"

    move-object/from16 v53, v14

    const/4 v14, 0x6

    invoke-direct {v1, v10, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "SensorRightBorder"

    move-object/from16 v54, v1

    const/4 v1, 0x7

    invoke-direct {v10, v14, v1, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v14, "ISO"

    const/16 v1, 0x17

    move-object/from16 v55, v10

    const/4 v10, 0x3

    invoke-direct {v5, v14, v1, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v10, "JpgFromRaw"

    const/16 v14, 0x2e

    move-object/from16 v56, v5

    const/4 v5, 0x7

    invoke-direct {v1, v10, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    move-object/from16 v57, v1

    filled-new-array/range {v17 .. v57}, [Lw10;

    move-result-object v74

    .line 16
    new-instance v1, Lw10;

    const-string v5, "ExposureTime"

    const v10, 0x829a

    const/4 v14, 0x5

    invoke-direct {v1, v5, v10, v14}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v10, "FNumber"

    move-object/from16 v75, v1

    const v1, 0x829d

    invoke-direct {v5, v10, v1, v14}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v10, "ExposureProgram"

    const v14, 0x8822

    move-object/from16 v76, v5

    const/4 v5, 0x3

    invoke-direct {v1, v10, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "SpectralSensitivity"

    const v5, 0x8824

    move-object/from16 v77, v1

    const/4 v1, 0x2

    invoke-direct {v10, v14, v5, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v5, "PhotographicSensitivity"

    const v14, 0x8827

    move-object/from16 v78, v10

    const/4 v10, 0x3

    invoke-direct {v1, v5, v14, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v10, "OECF"

    const v14, 0x8828

    move-object/from16 v79, v1

    const/4 v1, 0x7

    invoke-direct {v5, v10, v14, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v10, "ExifVersion"

    const v14, 0x9000

    move-object/from16 v80, v5

    const/4 v5, 0x2

    invoke-direct {v1, v10, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "DateTimeOriginal"

    move-object/from16 v81, v1

    const v1, 0x9003

    invoke-direct {v10, v14, v1, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v14, "DateTimeDigitized"

    move-object/from16 v82, v10

    const v10, 0x9004

    invoke-direct {v1, v14, v10, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v10, "ComponentsConfiguration"

    const v14, 0x9101

    move-object/from16 v83, v1

    const/4 v1, 0x7

    invoke-direct {v5, v10, v14, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v10, "CompressedBitsPerPixel"

    const v14, 0x9102

    move-object/from16 v84, v5

    const/4 v5, 0x5

    invoke-direct {v1, v10, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "ShutterSpeedValue"

    const v5, 0x9201

    move-object/from16 v85, v1

    const/16 v1, 0xa

    invoke-direct {v10, v14, v5, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v14, "ApertureValue"

    const v1, 0x9202

    move-object/from16 v86, v10

    const/4 v10, 0x5

    invoke-direct {v5, v14, v1, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v10, "BrightnessValue"

    const v14, 0x9203

    move-object/from16 v87, v5

    const/16 v5, 0xa

    invoke-direct {v1, v10, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "ExposureBiasValue"

    move-object/from16 v88, v1

    const v1, 0x9204

    invoke-direct {v10, v14, v1, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v5, "MaxApertureValue"

    const v14, 0x9205

    move-object/from16 v89, v10

    const/4 v10, 0x5

    invoke-direct {v1, v5, v14, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v14, "SubjectDistance"

    move-object/from16 v90, v1

    const v1, 0x9206

    invoke-direct {v5, v14, v1, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v10, "MeteringMode"

    const v14, 0x9207

    move-object/from16 v91, v5

    const/4 v5, 0x3

    invoke-direct {v1, v10, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "LightSource"

    move-object/from16 v92, v1

    const v1, 0x9208

    invoke-direct {v10, v14, v1, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v14, "Flash"

    move-object/from16 v93, v10

    const v10, 0x9209

    invoke-direct {v1, v14, v10, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "FocalLength"

    const v5, 0x920a

    move-object/from16 v94, v1

    const/4 v1, 0x5

    invoke-direct {v10, v14, v5, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v5, "SubjectArea"

    const v14, 0x9214

    move-object/from16 v95, v10

    const/4 v10, 0x3

    invoke-direct {v1, v5, v14, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v10, "MakerNote"

    const v14, 0x927c

    move-object/from16 v96, v1

    const/4 v1, 0x7

    invoke-direct {v5, v10, v14, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "UserComment"

    move-object/from16 v97, v5

    const v5, 0x9286

    invoke-direct {v10, v14, v5, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v5, "SubSecTime"

    const v14, 0x9290

    move-object/from16 v98, v10

    const/4 v10, 0x2

    invoke-direct {v1, v5, v14, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v14, "SubSecTimeOriginal"

    move-object/from16 v99, v1

    const v1, 0x9291

    invoke-direct {v5, v14, v1, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v14, "SubSecTimeDigitized"

    move-object/from16 v100, v5

    const v5, 0x9292

    invoke-direct {v1, v14, v5, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v10, "FlashpixVersion"

    const v14, 0xa000

    move-object/from16 v101, v1

    const/4 v1, 0x7

    invoke-direct {v5, v10, v14, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v10, "ColorSpace"

    const v14, 0xa001

    move-object/from16 v102, v5

    const/4 v5, 0x3

    invoke-direct {v1, v10, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v10, "PixelXDimension"

    const v14, 0xa002

    invoke-direct {v5, v10, v14}, Lw10;-><init>(Ljava/lang/String;I)V

    new-instance v10, Lw10;

    const-string v14, "PixelYDimension"

    move-object/from16 v103, v1

    const v1, 0xa003

    invoke-direct {v10, v14, v1}, Lw10;-><init>(Ljava/lang/String;I)V

    new-instance v1, Lw10;

    const-string v14, "RelatedSoundFile"

    move-object/from16 v104, v5

    const v5, 0xa004

    move-object/from16 v105, v10

    const/4 v10, 0x2

    invoke-direct {v1, v14, v5, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v10, "InteroperabilityIFDPointer"

    const v14, 0xa005

    move-object/from16 v106, v1

    const/4 v1, 0x4

    invoke-direct {v5, v10, v14, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v10, "FlashEnergy"

    const v14, 0xa20b

    move-object/from16 v107, v5

    const/4 v5, 0x5

    invoke-direct {v1, v10, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "SpatialFrequencyResponse"

    const v5, 0xa20c

    move-object/from16 v108, v1

    const/4 v1, 0x7

    invoke-direct {v10, v14, v5, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v5, "FocalPlaneXResolution"

    const v14, 0xa20e

    move-object/from16 v109, v10

    const/4 v10, 0x5

    invoke-direct {v1, v5, v14, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v14, "FocalPlaneYResolution"

    move-object/from16 v110, v1

    const v1, 0xa20f

    invoke-direct {v5, v14, v1, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v10, "FocalPlaneResolutionUnit"

    const v14, 0xa210

    move-object/from16 v111, v5

    const/4 v5, 0x3

    invoke-direct {v1, v10, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "SubjectLocation"

    move-object/from16 v112, v1

    const v1, 0xa214

    invoke-direct {v10, v14, v1, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v14, "ExposureIndex"

    const v5, 0xa215

    move-object/from16 v113, v10

    const/4 v10, 0x5

    invoke-direct {v1, v14, v5, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v10, "SensingMethod"

    const v14, 0xa217

    move-object/from16 v114, v1

    const/4 v1, 0x3

    invoke-direct {v5, v10, v14, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v10, "FileSource"

    const v14, 0xa300

    move-object/from16 v115, v5

    const/4 v5, 0x7

    invoke-direct {v1, v10, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "SceneType"

    move-object/from16 v116, v1

    const v1, 0xa301

    invoke-direct {v10, v14, v1, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v14, "CFAPattern"

    move-object/from16 v117, v10

    const v10, 0xa302

    invoke-direct {v1, v14, v10, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v10, "CustomRendered"

    const v14, 0xa401

    move-object/from16 v118, v1

    const/4 v1, 0x3

    invoke-direct {v5, v10, v14, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "ExposureMode"

    move-object/from16 v119, v5

    const v5, 0xa402

    invoke-direct {v10, v14, v5, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v14, "WhiteBalance"

    move-object/from16 v120, v10

    const v10, 0xa403

    invoke-direct {v5, v14, v10, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "DigitalZoomRatio"

    const v1, 0xa404

    move-object/from16 v121, v5

    const/4 v5, 0x5

    invoke-direct {v10, v14, v1, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v5, "FocalLengthIn35mmFilm"

    const v14, 0xa405

    move-object/from16 v122, v10

    const/4 v10, 0x3

    invoke-direct {v1, v5, v14, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v14, "SceneCaptureType"

    move-object/from16 v123, v1

    const v1, 0xa406

    invoke-direct {v5, v14, v1, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v14, "GainControl"

    move-object/from16 v124, v5

    const v5, 0xa407

    invoke-direct {v1, v14, v5, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v14, "Contrast"

    move-object/from16 v125, v1

    const v1, 0xa408

    invoke-direct {v5, v14, v1, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v14, "Saturation"

    move-object/from16 v126, v5

    const v5, 0xa409

    invoke-direct {v1, v14, v5, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v14, "Sharpness"

    move-object/from16 v127, v1

    const v1, 0xa40a

    invoke-direct {v5, v14, v1, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v14, "DeviceSettingDescription"

    const v10, 0xa40b

    move-object/from16 v128, v5

    const/4 v5, 0x7

    invoke-direct {v1, v14, v10, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v10, "SubjectDistanceRange"

    const v14, 0xa40c

    move-object/from16 v129, v1

    const/4 v1, 0x3

    invoke-direct {v5, v10, v14, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v10, "ImageUniqueID"

    const v14, 0xa420

    move-object/from16 v130, v5

    const/4 v5, 0x2

    invoke-direct {v1, v10, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v10, "DNGVersion"

    const v14, 0xc612

    move-object/from16 v131, v1

    const/4 v1, 0x1

    invoke-direct {v5, v10, v14, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "DefaultCropSize"

    const v1, 0xc620

    invoke-direct {v10, v14, v1}, Lw10;-><init>(Ljava/lang/String;I)V

    move-object/from16 v132, v5

    move-object/from16 v133, v10

    filled-new-array/range {v75 .. v133}, [Lw10;

    move-result-object v75

    .line 17
    new-instance v1, Lw10;

    const-string v5, "GPSVersionID"

    const/4 v10, 0x0

    const/4 v14, 0x1

    invoke-direct {v1, v5, v10, v14}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    move/from16 v48, v10

    const-string v10, "GPSLatitudeRef"

    move-object/from16 v17, v1

    const/4 v1, 0x2

    invoke-direct {v5, v10, v14, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "GPSLatitude"

    move-object/from16 v18, v5

    const/4 v5, 0x5

    invoke-direct {v10, v14, v1, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v14, Lw10;

    const-string v5, "GPSLongitudeRef"

    move-object/from16 v19, v10

    const/4 v10, 0x3

    invoke-direct {v14, v5, v10, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v5, "GPSLongitude"

    move-object/from16 v20, v14

    const/4 v10, 0x4

    const/4 v14, 0x5

    invoke-direct {v1, v5, v10, v14}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v10, "GPSAltitudeRef"

    move-object/from16 v21, v1

    const/4 v1, 0x1

    invoke-direct {v5, v10, v14, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v10, "GPSAltitude"

    move-object/from16 v22, v5

    const/4 v5, 0x6

    invoke-direct {v1, v10, v5, v14}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v10, "GPSTimeStamp"

    move-object/from16 v23, v1

    const/4 v1, 0x7

    invoke-direct {v5, v10, v1, v14}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v10, "GPSSatellites"

    move-object/from16 v24, v5

    const/4 v5, 0x2

    const/16 v14, 0x8

    invoke-direct {v1, v10, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "GPSStatus"

    move-object/from16 v25, v1

    const/16 v1, 0x9

    invoke-direct {v10, v14, v1, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v14, "GPSMeasureMode"

    move-object/from16 v26, v10

    const/16 v10, 0xa

    invoke-direct {v1, v14, v10, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "GPSDOP"

    const/16 v5, 0xb

    move-object/from16 v27, v1

    const/4 v1, 0x5

    invoke-direct {v10, v14, v5, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v14, "GPSSpeedRef"

    const/16 v1, 0xc

    move-object/from16 v28, v10

    const/4 v10, 0x2

    invoke-direct {v5, v14, v1, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v14, "GPSSpeed"

    const/16 v10, 0xd

    move-object/from16 v29, v5

    const/4 v5, 0x5

    invoke-direct {v1, v14, v10, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "GPSTrackRef"

    move-object/from16 v30, v1

    const/16 v1, 0xe

    const/4 v5, 0x2

    invoke-direct {v10, v14, v1, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v14, "GPSTrack"

    const/16 v5, 0xf

    move-object/from16 v31, v10

    const/4 v10, 0x5

    invoke-direct {v1, v14, v5, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v14, "GPSImgDirectionRef"

    const/16 v10, 0x10

    move-object/from16 v32, v1

    const/4 v1, 0x2

    invoke-direct {v5, v14, v10, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "GPSImgDirection"

    const/16 v1, 0x11

    move-object/from16 v33, v5

    const/4 v5, 0x5

    invoke-direct {v10, v14, v1, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v5, "GPSMapDatum"

    const/16 v14, 0x12

    move-object/from16 v34, v10

    const/4 v10, 0x2

    invoke-direct {v1, v5, v14, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v14, "GPSDestLatitudeRef"

    move-object/from16 v35, v1

    const/16 v1, 0x13

    invoke-direct {v5, v14, v1, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v14, "GPSDestLatitude"

    const/16 v10, 0x14

    move-object/from16 v36, v5

    const/4 v5, 0x5

    invoke-direct {v1, v14, v10, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "GPSDestLongitudeRef"

    const/16 v5, 0x15

    move-object/from16 v37, v1

    const/4 v1, 0x2

    invoke-direct {v10, v14, v5, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v14, "GPSDestLongitude"

    const/16 v1, 0x16

    move-object/from16 v38, v10

    const/4 v10, 0x5

    invoke-direct {v5, v14, v1, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v14, "GPSDestBearingRef"

    const/16 v10, 0x17

    move-object/from16 v39, v5

    const/4 v5, 0x2

    invoke-direct {v1, v14, v10, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "GPSDestBearing"

    const/16 v5, 0x18

    move-object/from16 v40, v1

    const/4 v1, 0x5

    invoke-direct {v10, v14, v5, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v14, "GPSDestDistanceRef"

    const/16 v1, 0x19

    move-object/from16 v41, v10

    const/4 v10, 0x2

    invoke-direct {v5, v14, v1, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v10, "GPSDestDistance"

    const/16 v14, 0x1a

    move-object/from16 v42, v5

    const/4 v5, 0x5

    invoke-direct {v1, v10, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v10, "GPSProcessingMethod"

    const/16 v14, 0x1b

    move-object/from16 v43, v1

    const/4 v1, 0x7

    invoke-direct {v5, v10, v14, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v14, "GPSAreaInformation"

    move-object/from16 v44, v5

    const/16 v5, 0x1c

    invoke-direct {v10, v14, v5, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v5, "GPSDateStamp"

    const/16 v14, 0x1d

    move-object/from16 v45, v10

    const/4 v10, 0x2

    invoke-direct {v1, v5, v14, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const-string v14, "GPSDifferential"

    const/16 v10, 0x1e

    move-object/from16 v46, v1

    const/4 v1, 0x3

    invoke-direct {v5, v14, v10, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    move-object/from16 v47, v5

    filled-new-array/range {v17 .. v47}, [Lw10;

    move-result-object v76

    .line 18
    new-instance v1, Lw10;

    const-string v5, "InteroperabilityIndex"

    const/4 v10, 0x2

    const/4 v14, 0x1

    invoke-direct {v1, v5, v14, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    filled-new-array {v1}, [Lw10;

    move-result-object v77

    .line 19
    new-instance v1, Lw10;

    const/16 v5, 0xfe

    const/4 v10, 0x4

    invoke-direct {v1, v15, v5, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const/16 v14, 0xff

    invoke-direct {v5, v12, v14, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v10, Lw10;

    const-string v12, "ThumbnailImageWidth"

    const/16 v14, 0x100

    invoke-direct {v10, v12, v14}, Lw10;-><init>(Ljava/lang/String;I)V

    new-instance v12, Lw10;

    const-string v14, "ThumbnailImageLength"

    const/16 v15, 0x101

    invoke-direct {v12, v14, v15}, Lw10;-><init>(Ljava/lang/String;I)V

    new-instance v14, Lw10;

    move-object/from16 v78, v1

    const/16 v1, 0x102

    const/4 v15, 0x3

    invoke-direct {v14, v13, v1, v15}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const/16 v13, 0x103

    invoke-direct {v1, v0, v13, v15}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v0, Lw10;

    const/16 v13, 0x106

    invoke-direct {v0, v3, v13, v15}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v3, Lw10;

    const/4 v13, 0x2

    const/16 v15, 0x10e

    invoke-direct {v3, v4, v15, v13}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v4, Lw10;

    const/16 v15, 0x10f

    invoke-direct {v4, v6, v15, v13}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v6, Lw10;

    const/16 v15, 0x110

    invoke-direct {v6, v2, v15, v13}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lw10;

    const/16 v13, 0x111

    invoke-direct {v2, v7, v13}, Lw10;-><init>(Ljava/lang/String;I)V

    new-instance v13, Lw10;

    move-object/from16 v84, v0

    const/4 v15, 0x3

    const/16 v0, 0x112

    invoke-direct {v13, v9, v0, v15}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v0, Lw10;

    const/16 v9, 0x115

    invoke-direct {v0, v11, v9, v15}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v9, Lw10;

    const/16 v11, 0x116

    invoke-direct {v9, v8, v11}, Lw10;-><init>(Ljava/lang/String;I)V

    new-instance v8, Lw10;

    move-object/from16 v11, v68

    const/16 v15, 0x117

    invoke-direct {v8, v11, v15}, Lw10;-><init>(Ljava/lang/String;I)V

    new-instance v11, Lw10;

    move-object/from16 v90, v0

    move-object/from16 v83, v1

    move-object/from16 v0, v69

    const/16 v1, 0x11a

    const/4 v15, 0x5

    invoke-direct {v11, v0, v1, v15}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v0, Lw10;

    move-object/from16 v88, v2

    move-object/from16 v1, v70

    const/16 v2, 0x11b

    invoke-direct {v0, v1, v2, v15}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v2, "PlanarConfiguration"

    const/16 v15, 0x11c

    move-object/from16 v94, v0

    const/4 v0, 0x3

    invoke-direct {v1, v2, v15, v0}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lw10;

    const-string v15, "ResolutionUnit"

    move-object/from16 v95, v1

    const/16 v1, 0x128

    invoke-direct {v2, v15, v1, v0}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v15, "TransferFunction"

    move-object/from16 v96, v2

    const/16 v2, 0x12d

    invoke-direct {v1, v15, v2, v0}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v0, Lw10;

    const-string v2, "Software"

    const/16 v15, 0x131

    move-object/from16 v97, v1

    const/4 v1, 0x2

    invoke-direct {v0, v2, v15, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lw10;

    const-string v15, "DateTime"

    move-object/from16 v98, v0

    const/16 v0, 0x132

    invoke-direct {v2, v15, v0, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v0, Lw10;

    const-string v15, "Artist"

    move-object/from16 v99, v2

    const/16 v2, 0x13b

    invoke-direct {v0, v15, v2, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v2, "WhitePoint"

    const/16 v15, 0x13e

    move-object/from16 v100, v0

    const/4 v0, 0x5

    invoke-direct {v1, v2, v15, v0}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lw10;

    const-string v15, "PrimaryChromaticities"

    move-object/from16 v101, v1

    const/16 v1, 0x13f

    invoke-direct {v2, v15, v1, v0}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v0, Lw10;

    move-object/from16 v102, v2

    move-object/from16 v15, v71

    const/4 v1, 0x4

    const/16 v2, 0x14a

    invoke-direct {v0, v15, v2, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lw10;

    move-object/from16 v103, v0

    const-string v0, "JPEGInterchangeFormat"

    move-object/from16 v85, v3

    const/16 v3, 0x201

    invoke-direct {v2, v0, v3, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v0, Lw10;

    const-string v3, "JPEGInterchangeFormatLength"

    move-object/from16 v104, v2

    const/16 v2, 0x202

    invoke-direct {v0, v3, v2, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v2, "YCbCrCoefficients"

    const/16 v3, 0x211

    move-object/from16 v105, v0

    const/4 v0, 0x5

    invoke-direct {v1, v2, v3, v0}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v0, Lw10;

    const-string v2, "YCbCrSubSampling"

    const/16 v3, 0x212

    move-object/from16 v106, v1

    const/4 v1, 0x3

    invoke-direct {v0, v2, v3, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lw10;

    const-string v3, "YCbCrPositioning"

    move-object/from16 v107, v0

    const/16 v0, 0x213

    invoke-direct {v2, v3, v0, v1}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v0, Lw10;

    const-string v1, "ReferenceBlackWhite"

    const/16 v3, 0x214

    move-object/from16 v108, v2

    const/4 v2, 0x5

    invoke-direct {v0, v1, v3, v2}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v2, "Copyright"

    const v3, 0x8298

    move-object/from16 v109, v0

    const/4 v0, 0x2

    invoke-direct {v1, v2, v3, v0}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v0, Lw10;

    move-object/from16 v110, v1

    move-object/from16 v3, v72

    const v1, 0x8769

    const/4 v2, 0x4

    invoke-direct {v0, v3, v1, v2}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    move-object/from16 v111, v0

    move-object/from16 v86, v4

    move-object/from16 v0, v73

    const v4, 0x8825

    invoke-direct {v1, v0, v4, v2}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lw10;

    const-string v4, "DNGVersion"

    move-object/from16 v112, v1

    const v1, 0xc612

    move-object/from16 v79, v5

    const/4 v5, 0x1

    invoke-direct {v2, v4, v1, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v1, Lw10;

    const-string v4, "DefaultCropSize"

    const v5, 0xc620

    invoke-direct {v1, v4, v5}, Lw10;-><init>(Ljava/lang/String;I)V

    move-object/from16 v114, v1

    move-object/from16 v113, v2

    move-object/from16 v87, v6

    move-object/from16 v92, v8

    move-object/from16 v91, v9

    move-object/from16 v80, v10

    move-object/from16 v93, v11

    move-object/from16 v81, v12

    move-object/from16 v89, v13

    move-object/from16 v82, v14

    filled-new-array/range {v78 .. v114}, [Lw10;

    move-result-object v78

    .line 20
    new-instance v1, Lw10;

    const/4 v5, 0x3

    const/16 v13, 0x111

    invoke-direct {v1, v7, v13, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    sput-object v1, Ly10;->s:Lw10;

    .line 21
    new-instance v1, Lw10;

    const-string v2, "ThumbnailImage"

    const/4 v5, 0x7

    const/16 v14, 0x100

    invoke-direct {v1, v2, v14, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lw10;

    const-string v4, "CameraSettingsIFDPointer"

    const/16 v5, 0x2020

    const/4 v10, 0x4

    invoke-direct {v2, v4, v5, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v4, Lw10;

    const-string v5, "ImageProcessingIFDPointer"

    const/16 v6, 0x2040

    invoke-direct {v4, v5, v6, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    filled-new-array {v1, v2, v4}, [Lw10;

    move-result-object v80

    .line 22
    new-instance v1, Lw10;

    const-string v2, "PreviewImageStart"

    const/16 v4, 0x101

    invoke-direct {v1, v2, v4, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v2, Lw10;

    const-string v4, "PreviewImageLength"

    const/16 v5, 0x102

    invoke-direct {v2, v4, v5, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    filled-new-array {v1, v2}, [Lw10;

    move-result-object v81

    .line 23
    new-instance v1, Lw10;

    const-string v2, "AspectFrame"

    const/16 v4, 0x1113

    const/4 v5, 0x3

    invoke-direct {v1, v2, v4, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    filled-new-array {v1}, [Lw10;

    move-result-object v82

    .line 24
    new-instance v1, Lw10;

    const-string v2, "ColorSpace"

    const/16 v4, 0x37

    invoke-direct {v1, v2, v4, v5}, Lw10;-><init>(Ljava/lang/String;II)V

    filled-new-array {v1}, [Lw10;

    move-result-object v83

    move-object/from16 v79, v74

    .line 25
    filled-new-array/range {v74 .. v83}, [[Lw10;

    move-result-object v1

    sput-object v1, Ly10;->t:[[Lw10;

    .line 26
    new-instance v4, Lw10;

    const/16 v2, 0x14a

    const/4 v10, 0x4

    invoke-direct {v4, v15, v2, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v5, Lw10;

    const v1, 0x8769

    invoke-direct {v5, v3, v1, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v6, Lw10;

    const v1, 0x8825

    invoke-direct {v6, v0, v1, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v7, Lw10;

    const-string v0, "InteroperabilityIFDPointer"

    const v1, 0xa005

    invoke-direct {v7, v0, v1, v10}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v8, Lw10;

    const-string v0, "CameraSettingsIFDPointer"

    const/16 v1, 0x2020

    const/4 v14, 0x1

    invoke-direct {v8, v0, v1, v14}, Lw10;-><init>(Ljava/lang/String;II)V

    new-instance v9, Lw10;

    const-string v0, "ImageProcessingIFDPointer"

    const/16 v1, 0x2040

    invoke-direct {v9, v0, v1, v14}, Lw10;-><init>(Ljava/lang/String;II)V

    filled-new-array/range {v4 .. v9}, [Lw10;

    move-result-object v0

    sput-object v0, Ly10;->u:[Lw10;

    const/16 v1, 0xa

    .line 27
    new-array v0, v1, [Ljava/util/HashMap;

    sput-object v0, Ly10;->v:[Ljava/util/HashMap;

    .line 28
    new-array v0, v1, [Ljava/util/HashMap;

    sput-object v0, Ly10;->w:[Ljava/util/HashMap;

    .line 29
    new-instance v0, Ljava/util/HashSet;

    const-string v1, "SubjectDistance"

    const-string v2, "GPSTimeStamp"

    const-string v3, "FNumber"

    const-string v4, "DigitalZoomRatio"

    const-string v5, "ExposureTime"

    filled-new-array {v3, v4, v5, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Ly10;->x:Ljava/util/HashSet;

    .line 30
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Ly10;->y:Ljava/util/HashMap;

    .line 31
    const-string v0, "US-ASCII"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Ly10;->z:Ljava/nio/charset/Charset;

    .line 32
    const-string v1, "Exif\u0000\u0000"

    invoke-virtual {v1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Ly10;->A:[B

    .line 33
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy:MM:dd HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 34
    const-string v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    move/from16 v0, v48

    .line 35
    :goto_0
    sget-object v1, Ly10;->t:[[Lw10;

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 36
    sget-object v2, Ly10;->v:[Ljava/util/HashMap;

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    aput-object v3, v2, v0

    .line 37
    sget-object v2, Ly10;->w:[Ljava/util/HashMap;

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    aput-object v3, v2, v0

    .line 38
    aget-object v1, v1, v0

    array-length v2, v1

    move/from16 v3, v48

    :goto_1
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    .line 39
    sget-object v5, Ly10;->v:[Ljava/util/HashMap;

    aget-object v5, v5, v0

    iget v6, v4, Lw10;->a:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    sget-object v5, Ly10;->w:[Ljava/util/HashMap;

    aget-object v5, v5, v0

    iget-object v6, v4, Lw10;->b:Ljava/lang/String;

    invoke-virtual {v5, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 41
    :cond_1
    sget-object v0, Ly10;->y:Ljava/util/HashMap;

    sget-object v1, Ly10;->u:[Lw10;

    aget-object v2, v1, v48

    iget v2, v2, Lw10;->a:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v3, v67

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v16, 0x1

    .line 42
    aget-object v2, v1, v16

    iget v2, v2, Lw10;->a:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v3, v66

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v60, 0x2

    .line 43
    aget-object v2, v1, v60

    iget v2, v2, Lw10;->a:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v3, v65

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v61, 0x3

    .line 44
    aget-object v2, v1, v61

    iget v2, v2, Lw10;->a:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v3, v64

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v58, 0x4

    .line 45
    aget-object v2, v1, v58

    iget v2, v2, Lw10;->a:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v3, v63

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v59, 0x5

    .line 46
    aget-object v1, v1, v59

    iget v1, v1, Lw10;->a:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v2, v62

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    const-string v0, ".*[1-9].*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 48
    const-string v0, "^([0-9][0-9]):([0-9][0-9]):([0-9][0-9])$"

    .line 49
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    return-void

    :array_0
    .array-data 1
        -0x1t
        -0x28t
        -0x1t
    .end array-data

    :array_1
    .array-data 1
        0x4ft
        0x4ct
        0x59t
        0x4dt
        0x50t
        0x0t
    .end array-data

    nop

    :array_2
    .array-data 1
        0x4ft
        0x4ct
        0x59t
        0x4dt
        0x50t
        0x55t
        0x53t
        0x0t
        0x49t
        0x49t
    .end array-data

    nop

    :array_3
    .array-data 4
        0x0
        0x1
        0x1
        0x2
        0x4
        0x8
        0x1
        0x1
        0x2
        0x4
        0x8
        0x4
        0x8
        0x1
    .end array-data

    :array_4
    .array-data 1
        0x41t
        0x53t
        0x43t
        0x49t
        0x49t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ly10;->t:[[Lw10;

    .line 5
    .line 6
    array-length v1, v0

    .line 7
    new-array v1, v1, [Ljava/util/HashMap;

    .line 8
    .line 9
    iput-object v1, p0, Ly10;->c:[Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v1, Ljava/util/HashSet;

    .line 12
    .line 13
    array-length v0, v0

    .line 14
    invoke-direct {v1, v0}, Ljava/util/HashSet;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ly10;->d:Ljava/util/HashSet;

    .line 18
    .line 19
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 20
    .line 21
    iput-object v0, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    iput-object p1, p0, Ly10;->a:Ljava/lang/String;

    .line 27
    .line 28
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    .line 29
    .line 30
    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 31
    .line 32
    .line 33
    :try_start_1
    invoke-virtual {p0, v1}, Ly10;->m(Ljava/io/FileInputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    .line 36
    :try_start_2
    invoke-interface {v1}, Ljava/io/Closeable;->close()V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 37
    .line 38
    .line 39
    :catch_0
    return-void

    .line 40
    :catch_1
    move-exception p0

    .line 41
    throw p0

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    move-object v0, v1

    .line 44
    goto :goto_0

    .line 45
    :catchall_1
    move-exception p0

    .line 46
    :goto_0
    if-eqz v0, :cond_0

    .line 47
    .line 48
    :try_start_3
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :catch_2
    move-exception p0

    .line 53
    throw p0

    .line 54
    :catch_3
    :cond_0
    :goto_1
    throw p0

    .line 55
    :cond_1
    const-string p0, "filename cannot be null"

    .line 56
    .line 57
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    throw v0
.end method

.method public static b(Ljava/io/Serializable;)[J
    .locals 4

    .line 1
    instance-of v0, p0, [I

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    check-cast p0, [I

    .line 6
    .line 7
    array-length v0, p0

    .line 8
    new-array v0, v0, [J

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    array-length v2, p0

    .line 12
    if-ge v1, v2, :cond_0

    .line 13
    .line 14
    aget v2, p0, v1

    .line 15
    .line 16
    int-to-long v2, v2

    .line 17
    aput-wide v2, v0, v1

    .line 18
    .line 19
    add-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-object v0

    .line 23
    :cond_1
    instance-of v0, p0, [J

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    check-cast p0, [J

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_2
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public static o(Lu10;)Ljava/nio/ByteOrder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lu10;->readShort()S

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x4949

    .line 6
    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    const/16 v0, 0x4d4d

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    sget-object p0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string v0, "Invalid byte order: "

    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0, v0}, Lz0;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return-object p0

    .line 27
    :cond_1
    sget-object p0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 28
    .line 29
    return-object p0
.end method


# virtual methods
.method public final a()V
    .locals 8

    .line 1
    const-string v0, "DateTimeOriginal"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ly10;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    iget-object v2, p0, Ly10;->c:[Ljava/util/HashMap;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v3, "DateTime"

    .line 13
    .line 14
    invoke-virtual {p0, v3}, Ly10;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    if-nez v4, :cond_0

    .line 19
    .line 20
    aget-object v4, v2, v1

    .line 21
    .line 22
    const-string v5, "\u0000"

    .line 23
    .line 24
    invoke-virtual {v0, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v5, Ly10;->z:Ljava/nio/charset/Charset;

    .line 29
    .line 30
    invoke-virtual {v0, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v5, Lv10;

    .line 35
    .line 36
    const/4 v6, 0x2

    .line 37
    array-length v7, v0

    .line 38
    invoke-direct {v5, v0, v6, v7}, Lv10;-><init>([BII)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v4, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    :cond_0
    const-string v0, "ImageWidth"

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ly10;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    const-wide/16 v4, 0x0

    .line 51
    .line 52
    if-nez v3, :cond_1

    .line 53
    .line 54
    aget-object v3, v2, v1

    .line 55
    .line 56
    iget-object v6, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 57
    .line 58
    invoke-static {v4, v5, v6}, Lv10;->a(JLjava/nio/ByteOrder;)Lv10;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    invoke-virtual {v3, v0, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    :cond_1
    const-string v0, "ImageLength"

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ly10;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    if-nez v3, :cond_2

    .line 72
    .line 73
    aget-object v3, v2, v1

    .line 74
    .line 75
    iget-object v6, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 76
    .line 77
    invoke-static {v4, v5, v6}, Lv10;->a(JLjava/nio/ByteOrder;)Lv10;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    invoke-virtual {v3, v0, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    :cond_2
    const-string v0, "Orientation"

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Ly10;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    if-nez v3, :cond_3

    .line 91
    .line 92
    aget-object v1, v2, v1

    .line 93
    .line 94
    iget-object v3, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 95
    .line 96
    invoke-static {v4, v5, v3}, Lv10;->a(JLjava/nio/ByteOrder;)Lv10;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-virtual {v1, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    :cond_3
    const-string v0, "LightSource"

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Ly10;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    if-nez v1, :cond_4

    .line 110
    .line 111
    const/4 v1, 0x1

    .line 112
    aget-object v1, v2, v1

    .line 113
    .line 114
    iget-object p0, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 115
    .line 116
    invoke-static {v4, v5, p0}, Lv10;->a(JLjava/nio/ByteOrder;)Lv10;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {v1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    :cond_4
    return-void
.end method

.method public final c(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Ly10;->d(Ljava/lang/String;)Lv10;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_5

    .line 7
    .line 8
    sget-object v2, Ly10;->x:Ljava/util/HashSet;

    .line 9
    .line 10
    invoke-virtual {v2, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Lv10;->f(Ljava/nio/ByteOrder;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_0
    const-string v2, "GPSTimeStamp"

    .line 24
    .line 25
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_4

    .line 30
    .line 31
    iget p1, v0, Lv10;->a:I

    .line 32
    .line 33
    const/4 v2, 0x5

    .line 34
    if-eq p1, v2, :cond_1

    .line 35
    .line 36
    const/16 v2, 0xa

    .line 37
    .line 38
    if-eq p1, v2, :cond_1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    iget-object p0, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Lv10;->g(Ljava/nio/ByteOrder;)Ljava/io/Serializable;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, [Lx10;

    .line 48
    .line 49
    if-eqz p0, :cond_3

    .line 50
    .line 51
    array-length p1, p0

    .line 52
    const/4 v0, 0x3

    .line 53
    if-eq p1, v0, :cond_2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    const/4 p1, 0x0

    .line 57
    aget-object p1, p0, p1

    .line 58
    .line 59
    iget-wide v0, p1, Lx10;->a:J

    .line 60
    .line 61
    long-to-float v0, v0

    .line 62
    iget-wide v1, p1, Lx10;->b:J

    .line 63
    .line 64
    long-to-float p1, v1

    .line 65
    div-float/2addr v0, p1

    .line 66
    float-to-int p1, v0

    .line 67
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    const/4 v0, 0x1

    .line 72
    aget-object v0, p0, v0

    .line 73
    .line 74
    iget-wide v1, v0, Lx10;->a:J

    .line 75
    .line 76
    long-to-float v1, v1

    .line 77
    iget-wide v2, v0, Lx10;->b:J

    .line 78
    .line 79
    long-to-float v0, v2

    .line 80
    div-float/2addr v1, v0

    .line 81
    float-to-int v0, v1

    .line 82
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const/4 v1, 0x2

    .line 87
    aget-object p0, p0, v1

    .line 88
    .line 89
    iget-wide v1, p0, Lx10;->a:J

    .line 90
    .line 91
    long-to-float v1, v1

    .line 92
    iget-wide v2, p0, Lx10;->b:J

    .line 93
    .line 94
    long-to-float p0, v2

    .line 95
    div-float/2addr v1, p0

    .line 96
    float-to-int p0, v1

    .line 97
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    filled-new-array {p1, v0, p0}, [Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    const-string p1, "%02d:%02d:%02d"

    .line 106
    .line 107
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0

    .line 112
    :cond_3
    :goto_0
    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    return-object v1

    .line 116
    :cond_4
    :try_start_0
    iget-object p0, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 117
    .line 118
    invoke-virtual {v0, p0}, Lv10;->d(Ljava/nio/ByteOrder;)D

    .line 119
    .line 120
    .line 121
    move-result-wide p0

    .line 122
    invoke-static {p0, p1}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    return-object p0

    .line 127
    :catch_0
    :cond_5
    :goto_1
    return-object v1
.end method

.method public final d(Ljava/lang/String;)Lv10;
    .locals 2

    .line 1
    const-string v0, "ISOSpeedRatings"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p1, "PhotographicSensitivity"

    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    :goto_0
    sget-object v1, Ly10;->t:[[Lw10;

    .line 13
    .line 14
    array-length v1, v1

    .line 15
    if-ge v0, v1, :cond_2

    .line 16
    .line 17
    iget-object v1, p0, Ly10;->c:[Ljava/util/HashMap;

    .line 18
    .line 19
    aget-object v1, v1, v0

    .line 20
    .line 21
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lv10;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    return-object v1

    .line 30
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    const/4 p0, 0x0

    .line 34
    return-object p0
.end method

.method public final e(Lu10;II)V
    .locals 11

    .line 1
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 2
    .line 3
    iput-object v0, p1, Lu10;->k:Ljava/nio/ByteOrder;

    .line 4
    .line 5
    int-to-long v0, p2

    .line 6
    invoke-virtual {p1, v0, v1}, Lu10;->a(J)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Lu10;->readByte()B

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const-string v1, "Invalid marker: "

    .line 14
    .line 15
    const/4 v2, -0x1

    .line 16
    if-ne v0, v2, :cond_11

    .line 17
    .line 18
    invoke-virtual {p1}, Lu10;->readByte()B

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    const/16 v4, -0x28

    .line 23
    .line 24
    if-ne v3, v4, :cond_10

    .line 25
    .line 26
    const/4 v0, 0x2

    .line 27
    add-int/2addr p2, v0

    .line 28
    :goto_0
    invoke-virtual {p1}, Lu10;->readByte()B

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-ne v1, v2, :cond_f

    .line 33
    .line 34
    invoke-virtual {p1}, Lu10;->readByte()B

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const/16 v3, -0x27

    .line 39
    .line 40
    if-eq v1, v3, :cond_e

    .line 41
    .line 42
    const/16 v3, -0x26

    .line 43
    .line 44
    if-ne v1, v3, :cond_0

    .line 45
    .line 46
    goto/16 :goto_3

    .line 47
    .line 48
    :cond_0
    invoke-virtual {p1}, Lu10;->readUnsignedShort()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    add-int/lit8 v4, v3, -0x2

    .line 53
    .line 54
    add-int/lit8 v5, p2, 0x4

    .line 55
    .line 56
    const-string v6, "Invalid length"

    .line 57
    .line 58
    if-ltz v4, :cond_d

    .line 59
    .line 60
    const/16 v7, -0x1f

    .line 61
    .line 62
    const/4 v8, 0x0

    .line 63
    const-string v9, "Invalid exif"

    .line 64
    .line 65
    if-eq v1, v7, :cond_5

    .line 66
    .line 67
    const/4 p2, -0x2

    .line 68
    const/4 v7, 0x1

    .line 69
    iget-object v10, p0, Ly10;->c:[Ljava/util/HashMap;

    .line 70
    .line 71
    if-eq v1, p2, :cond_2

    .line 72
    .line 73
    packed-switch v1, :pswitch_data_0

    .line 74
    .line 75
    .line 76
    packed-switch v1, :pswitch_data_1

    .line 77
    .line 78
    .line 79
    packed-switch v1, :pswitch_data_2

    .line 80
    .line 81
    .line 82
    packed-switch v1, :pswitch_data_3

    .line 83
    .line 84
    .line 85
    goto/16 :goto_2

    .line 86
    .line 87
    :pswitch_0
    invoke-virtual {p1, v7}, Lu10;->skipBytes(I)I

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    if-ne p2, v7, :cond_1

    .line 92
    .line 93
    aget-object p2, v10, p3

    .line 94
    .line 95
    invoke-virtual {p1}, Lu10;->readUnsignedShort()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    int-to-long v7, v1

    .line 100
    iget-object v1, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 101
    .line 102
    invoke-static {v7, v8, v1}, Lv10;->a(JLjava/nio/ByteOrder;)Lv10;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    const-string v4, "ImageLength"

    .line 107
    .line 108
    invoke-virtual {p2, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    aget-object p2, v10, p3

    .line 112
    .line 113
    invoke-virtual {p1}, Lu10;->readUnsignedShort()I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    int-to-long v7, v1

    .line 118
    iget-object v1, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 119
    .line 120
    invoke-static {v7, v8, v1}, Lv10;->a(JLjava/nio/ByteOrder;)Lv10;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    const-string v4, "ImageWidth"

    .line 125
    .line 126
    invoke-virtual {p2, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    add-int/lit8 v4, v3, -0x7

    .line 130
    .line 131
    goto/16 :goto_2

    .line 132
    .line 133
    :cond_1
    const-string p0, "Invalid SOFx"

    .line 134
    .line 135
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_2
    new-array p2, v4, [B

    .line 140
    .line 141
    invoke-virtual {p1, p2}, Ljava/io/InputStream;->read([B)I

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    if-ne v1, v4, :cond_4

    .line 146
    .line 147
    const-string v1, "UserComment"

    .line 148
    .line 149
    invoke-virtual {p0, v1}, Ly10;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    if-nez v3, :cond_3

    .line 154
    .line 155
    aget-object v3, v10, v7

    .line 156
    .line 157
    new-instance v4, Ljava/lang/String;

    .line 158
    .line 159
    sget-object v7, Ly10;->z:Ljava/nio/charset/Charset;

    .line 160
    .line 161
    invoke-direct {v4, p2, v7}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 162
    .line 163
    .line 164
    const-string p2, "\u0000"

    .line 165
    .line 166
    invoke-virtual {v4, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p2

    .line 170
    invoke-virtual {p2, v7}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 171
    .line 172
    .line 173
    move-result-object p2

    .line 174
    new-instance v4, Lv10;

    .line 175
    .line 176
    array-length v7, p2

    .line 177
    invoke-direct {v4, p2, v0, v7}, Lv10;-><init>([BII)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v3, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    :cond_3
    :goto_1
    move v4, v8

    .line 184
    goto :goto_2

    .line 185
    :cond_4
    invoke-static {v9}, Lo40;->k(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    return-void

    .line 189
    :cond_5
    const/4 v1, 0x6

    .line 190
    if-ge v4, v1, :cond_6

    .line 191
    .line 192
    goto :goto_2

    .line 193
    :cond_6
    new-array v4, v1, [B

    .line 194
    .line 195
    invoke-virtual {p1, v4}, Ljava/io/InputStream;->read([B)I

    .line 196
    .line 197
    .line 198
    move-result v5

    .line 199
    if-ne v5, v1, :cond_c

    .line 200
    .line 201
    add-int/lit8 v5, p2, 0xa

    .line 202
    .line 203
    add-int/lit8 p2, v3, -0x8

    .line 204
    .line 205
    sget-object v1, Ly10;->A:[B

    .line 206
    .line 207
    invoke-static {v4, v1}, Ljava/util/Arrays;->equals([B[B)Z

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    if-nez v1, :cond_7

    .line 212
    .line 213
    move v4, p2

    .line 214
    goto :goto_2

    .line 215
    :cond_7
    if-lez p2, :cond_b

    .line 216
    .line 217
    iput v5, p0, Ly10;->f:I

    .line 218
    .line 219
    new-array v1, p2, [B

    .line 220
    .line 221
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    .line 222
    .line 223
    .line 224
    move-result v3

    .line 225
    if-ne v3, p2, :cond_a

    .line 226
    .line 227
    add-int/2addr v5, p2

    .line 228
    new-instance v3, Lu10;

    .line 229
    .line 230
    invoke-direct {v3, v1}, Lu10;-><init>([B)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {p0, v3, p2}, Ly10;->n(Lu10;I)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {p0, v3, p3}, Ly10;->p(Lu10;I)V

    .line 237
    .line 238
    .line 239
    goto :goto_1

    .line 240
    :goto_2
    if-ltz v4, :cond_9

    .line 241
    .line 242
    invoke-virtual {p1, v4}, Lu10;->skipBytes(I)I

    .line 243
    .line 244
    .line 245
    move-result p2

    .line 246
    if-ne p2, v4, :cond_8

    .line 247
    .line 248
    add-int p2, v5, v4

    .line 249
    .line 250
    goto/16 :goto_0

    .line 251
    .line 252
    :cond_8
    const-string p0, "Invalid JPEG segment"

    .line 253
    .line 254
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    return-void

    .line 258
    :cond_9
    invoke-static {v6}, Lo40;->k(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    return-void

    .line 262
    :cond_a
    invoke-static {v9}, Lo40;->k(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    return-void

    .line 266
    :cond_b
    invoke-static {v9}, Lo40;->k(Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    return-void

    .line 270
    :cond_c
    invoke-static {v9}, Lo40;->k(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    return-void

    .line 274
    :cond_d
    invoke-static {v6}, Lo40;->k(Ljava/lang/String;)V

    .line 275
    .line 276
    .line 277
    return-void

    .line 278
    :cond_e
    :goto_3
    iget-object p0, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 279
    .line 280
    iput-object p0, p1, Lu10;->k:Ljava/nio/ByteOrder;

    .line 281
    .line 282
    return-void

    .line 283
    :cond_f
    and-int/lit16 p0, v1, 0xff

    .line 284
    .line 285
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object p0

    .line 289
    const-string p1, "Invalid marker:"

    .line 290
    .line 291
    invoke-static {p0, p1}, Lz0;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    return-void

    .line 295
    :cond_10
    and-int/lit16 p0, v0, 0xff

    .line 296
    .line 297
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object p0

    .line 301
    invoke-static {p0, v1}, Lz0;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 302
    .line 303
    .line 304
    return-void

    .line 305
    :cond_11
    and-int/lit16 p0, v0, 0xff

    .line 306
    .line 307
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object p0

    .line 311
    invoke-static {p0, v1}, Lz0;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    return-void

    .line 315
    :pswitch_data_0
    .packed-switch -0x40
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    .line 327
    :pswitch_data_1
    .packed-switch -0x3b
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    :pswitch_data_2
    .packed-switch -0x37
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    :pswitch_data_3
    .packed-switch -0x33
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final f(Ljava/io/BufferedInputStream;)I
    .locals 5

    .line 1
    const/16 v0, 0x1388

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/io/BufferedInputStream;->mark(I)V

    .line 4
    .line 5
    .line 6
    new-array v0, v0, [B

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/io/BufferedInputStream;->reset()V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    move v1, p1

    .line 16
    :goto_0
    sget-object v2, Ly10;->m:[B

    .line 17
    .line 18
    array-length v3, v2

    .line 19
    if-ge v1, v3, :cond_6

    .line 20
    .line 21
    aget-byte v3, v0, v1

    .line 22
    .line 23
    aget-byte v2, v2, v1

    .line 24
    .line 25
    if-eq v3, v2, :cond_5

    .line 26
    .line 27
    const-string v1, "FUJIFILMCCD-RAW"

    .line 28
    .line 29
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    move v2, p1

    .line 38
    :goto_1
    array-length v3, v1

    .line 39
    if-ge v2, v3, :cond_4

    .line 40
    .line 41
    aget-byte v3, v0, v2

    .line 42
    .line 43
    aget-byte v4, v1, v2

    .line 44
    .line 45
    if-eq v3, v4, :cond_3

    .line 46
    .line 47
    new-instance v1, Lu10;

    .line 48
    .line 49
    invoke-direct {v1, v0}, Lu10;-><init>([B)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ly10;->o(Lu10;)Ljava/nio/ByteOrder;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    iput-object v2, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 57
    .line 58
    iput-object v2, v1, Lu10;->k:Ljava/nio/ByteOrder;

    .line 59
    .line 60
    invoke-virtual {v1}, Lu10;->readShort()S

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 65
    .line 66
    .line 67
    const/16 v1, 0x4f52

    .line 68
    .line 69
    if-eq v2, v1, :cond_2

    .line 70
    .line 71
    const/16 v1, 0x5352

    .line 72
    .line 73
    if-ne v2, v1, :cond_0

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_0
    new-instance v1, Lu10;

    .line 77
    .line 78
    invoke-direct {v1, v0}, Lu10;-><init>([B)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Ly10;->o(Lu10;)Ljava/nio/ByteOrder;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iput-object v0, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 86
    .line 87
    iput-object v0, v1, Lu10;->k:Ljava/nio/ByteOrder;

    .line 88
    .line 89
    invoke-virtual {v1}, Lu10;->readShort()S

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 94
    .line 95
    .line 96
    const/16 v0, 0x55

    .line 97
    .line 98
    if-ne p0, v0, :cond_1

    .line 99
    .line 100
    const/16 p0, 0xa

    .line 101
    .line 102
    return p0

    .line 103
    :cond_1
    return p1

    .line 104
    :cond_2
    :goto_2
    const/4 p0, 0x7

    .line 105
    return p0

    .line 106
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_4
    const/16 p0, 0x9

    .line 110
    .line 111
    return p0

    .line 112
    :cond_5
    add-int/lit8 v1, v1, 0x1

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_6
    const/4 p0, 0x4

    .line 116
    return p0
.end method

.method public final g(Lu10;)V
    .locals 6

    .line 1
    invoke-virtual {p0, p1}, Ly10;->i(Lu10;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ly10;->c:[Ljava/util/HashMap;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    aget-object v1, p1, v0

    .line 8
    .line 9
    const-string v2, "MakerNote"

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lv10;

    .line 16
    .line 17
    if-eqz v1, :cond_6

    .line 18
    .line 19
    new-instance v2, Lu10;

    .line 20
    .line 21
    iget-object v1, v1, Lv10;->c:[B

    .line 22
    .line 23
    invoke-direct {v2, v1}, Lu10;-><init>([B)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 27
    .line 28
    iput-object v1, v2, Lu10;->k:Ljava/nio/ByteOrder;

    .line 29
    .line 30
    sget-object v1, Ly10;->n:[B

    .line 31
    .line 32
    array-length v3, v1

    .line 33
    new-array v3, v3, [B

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Lu10;->readFully([B)V

    .line 36
    .line 37
    .line 38
    const-wide/16 v4, 0x0

    .line 39
    .line 40
    invoke-virtual {v2, v4, v5}, Lu10;->a(J)V

    .line 41
    .line 42
    .line 43
    sget-object v4, Ly10;->o:[B

    .line 44
    .line 45
    array-length v5, v4

    .line 46
    new-array v5, v5, [B

    .line 47
    .line 48
    invoke-virtual {v2, v5}, Lu10;->readFully([B)V

    .line 49
    .line 50
    .line 51
    invoke-static {v3, v1}, Ljava/util/Arrays;->equals([B[B)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_0

    .line 56
    .line 57
    const-wide/16 v3, 0x8

    .line 58
    .line 59
    invoke-virtual {v2, v3, v4}, Lu10;->a(J)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    invoke-static {v5, v4}, Ljava/util/Arrays;->equals([B[B)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_1

    .line 68
    .line 69
    const-wide/16 v3, 0xc

    .line 70
    .line 71
    invoke-virtual {v2, v3, v4}, Lu10;->a(J)V

    .line 72
    .line 73
    .line 74
    :cond_1
    :goto_0
    const/4 v1, 0x6

    .line 75
    invoke-virtual {p0, v2, v1}, Ly10;->p(Lu10;I)V

    .line 76
    .line 77
    .line 78
    const/4 v1, 0x7

    .line 79
    aget-object v2, p1, v1

    .line 80
    .line 81
    const-string v3, "PreviewImageStart"

    .line 82
    .line 83
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    check-cast v2, Lv10;

    .line 88
    .line 89
    aget-object v1, p1, v1

    .line 90
    .line 91
    const-string v3, "PreviewImageLength"

    .line 92
    .line 93
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    check-cast v1, Lv10;

    .line 98
    .line 99
    if-eqz v2, :cond_2

    .line 100
    .line 101
    if-eqz v1, :cond_2

    .line 102
    .line 103
    const/4 v3, 0x5

    .line 104
    aget-object v4, p1, v3

    .line 105
    .line 106
    const-string v5, "JPEGInterchangeFormat"

    .line 107
    .line 108
    invoke-virtual {v4, v5, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    aget-object v2, p1, v3

    .line 112
    .line 113
    const-string v3, "JPEGInterchangeFormatLength"

    .line 114
    .line 115
    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    :cond_2
    const/16 v1, 0x8

    .line 119
    .line 120
    aget-object v1, p1, v1

    .line 121
    .line 122
    const-string v2, "AspectFrame"

    .line 123
    .line 124
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    check-cast v1, Lv10;

    .line 129
    .line 130
    if-eqz v1, :cond_6

    .line 131
    .line 132
    iget-object v2, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 133
    .line 134
    invoke-virtual {v1, v2}, Lv10;->g(Ljava/nio/ByteOrder;)Ljava/io/Serializable;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    check-cast v1, [I

    .line 139
    .line 140
    if-eqz v1, :cond_5

    .line 141
    .line 142
    array-length v2, v1

    .line 143
    const/4 v3, 0x4

    .line 144
    if-eq v2, v3, :cond_3

    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_3
    const/4 v2, 0x2

    .line 148
    aget v2, v1, v2

    .line 149
    .line 150
    const/4 v3, 0x0

    .line 151
    aget v4, v1, v3

    .line 152
    .line 153
    if-le v2, v4, :cond_6

    .line 154
    .line 155
    const/4 v5, 0x3

    .line 156
    aget v5, v1, v5

    .line 157
    .line 158
    aget v1, v1, v0

    .line 159
    .line 160
    if-le v5, v1, :cond_6

    .line 161
    .line 162
    sub-int/2addr v2, v4

    .line 163
    add-int/2addr v2, v0

    .line 164
    sub-int/2addr v5, v1

    .line 165
    add-int/2addr v5, v0

    .line 166
    if-ge v2, v5, :cond_4

    .line 167
    .line 168
    add-int/2addr v2, v5

    .line 169
    sub-int v5, v2, v5

    .line 170
    .line 171
    sub-int/2addr v2, v5

    .line 172
    :cond_4
    iget-object v0, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 173
    .line 174
    invoke-static {v2, v0}, Lv10;->c(ILjava/nio/ByteOrder;)Lv10;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    iget-object p0, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 179
    .line 180
    invoke-static {v5, p0}, Lv10;->c(ILjava/nio/ByteOrder;)Lv10;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    aget-object v1, p1, v3

    .line 185
    .line 186
    const-string v2, "ImageWidth"

    .line 187
    .line 188
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    aget-object p1, p1, v3

    .line 192
    .line 193
    const-string v0, "ImageLength"

    .line 194
    .line 195
    invoke-virtual {p1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    return-void

    .line 199
    :cond_5
    :goto_1
    invoke-static {v1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    :cond_6
    return-void
.end method

.method public final h(Lu10;)V
    .locals 6

    .line 1
    const/16 v0, 0x54

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lu10;->skipBytes(I)I

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x4

    .line 7
    new-array v1, v0, [B

    .line 8
    .line 9
    new-array v2, v0, [B

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lu10;->skipBytes(I)I

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v2}, Ljava/io/InputStream;->read([B)I

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const/4 v2, 0x5

    .line 37
    invoke-virtual {p0, p1, v0, v2}, Ly10;->e(Lu10;II)V

    .line 38
    .line 39
    .line 40
    int-to-long v0, v1

    .line 41
    invoke-virtual {p1, v0, v1}, Lu10;->a(J)V

    .line 42
    .line 43
    .line 44
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 45
    .line 46
    iput-object v0, p1, Lu10;->k:Ljava/nio/ByteOrder;

    .line 47
    .line 48
    invoke-virtual {p1}, Lu10;->readInt()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    const/4 v1, 0x0

    .line 53
    move v2, v1

    .line 54
    :goto_0
    if-ge v2, v0, :cond_1

    .line 55
    .line 56
    invoke-virtual {p1}, Lu10;->readUnsignedShort()I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-virtual {p1}, Lu10;->readUnsignedShort()I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    sget-object v5, Ly10;->s:Lw10;

    .line 65
    .line 66
    iget v5, v5, Lw10;->a:I

    .line 67
    .line 68
    if-ne v3, v5, :cond_0

    .line 69
    .line 70
    invoke-virtual {p1}, Lu10;->readShort()S

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    invoke-virtual {p1}, Lu10;->readShort()S

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iget-object v2, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 79
    .line 80
    invoke-static {v0, v2}, Lv10;->c(ILjava/nio/ByteOrder;)Lv10;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v2, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 85
    .line 86
    invoke-static {p1, v2}, Lv10;->c(ILjava/nio/ByteOrder;)Lv10;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iget-object p0, p0, Ly10;->c:[Ljava/util/HashMap;

    .line 91
    .line 92
    aget-object v2, p0, v1

    .line 93
    .line 94
    const-string v3, "ImageLength"

    .line 95
    .line 96
    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    aget-object p0, p0, v1

    .line 100
    .line 101
    const-string v0, "ImageWidth"

    .line 102
    .line 103
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_0
    invoke-virtual {p1, v4}, Lu10;->skipBytes(I)I

    .line 108
    .line 109
    .line 110
    add-int/lit8 v2, v2, 0x1

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_1
    return-void
.end method

.method public final i(Lu10;)V
    .locals 8

    .line 1
    iget-object v0, p1, Lu10;->j:Ljava/io/DataInputStream;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, p1, v0}, Ly10;->n(Lu10;I)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Ly10;->p(Lu10;I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1, v0}, Ly10;->s(Lu10;I)V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x5

    .line 18
    invoke-virtual {p0, p1, v1}, Ly10;->s(Lu10;I)V

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x4

    .line 22
    invoke-virtual {p0, p1, v2}, Ly10;->s(Lu10;I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Ly10;->r(II)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0, v2}, Ly10;->r(II)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v1, v2}, Ly10;->r(II)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ly10;->c:[Ljava/util/HashMap;

    .line 35
    .line 36
    const/4 v3, 0x1

    .line 37
    aget-object v4, p1, v3

    .line 38
    .line 39
    const-string v5, "PixelXDimension"

    .line 40
    .line 41
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    check-cast v4, Lv10;

    .line 46
    .line 47
    aget-object v5, p1, v3

    .line 48
    .line 49
    const-string v6, "PixelYDimension"

    .line 50
    .line 51
    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    check-cast v5, Lv10;

    .line 56
    .line 57
    if-eqz v4, :cond_0

    .line 58
    .line 59
    if-eqz v5, :cond_0

    .line 60
    .line 61
    aget-object v6, p1, v0

    .line 62
    .line 63
    const-string v7, "ImageWidth"

    .line 64
    .line 65
    invoke-virtual {v6, v7, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    aget-object v0, p1, v0

    .line 69
    .line 70
    const-string v4, "ImageLength"

    .line 71
    .line 72
    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    :cond_0
    aget-object v0, p1, v2

    .line 76
    .line 77
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_1

    .line 82
    .line 83
    aget-object v0, p1, v1

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Ly10;->l(Ljava/util/HashMap;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_1

    .line 90
    .line 91
    aget-object v0, p1, v1

    .line 92
    .line 93
    aput-object v0, p1, v2

    .line 94
    .line 95
    new-instance v0, Ljava/util/HashMap;

    .line 96
    .line 97
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 98
    .line 99
    .line 100
    aput-object v0, p1, v1

    .line 101
    .line 102
    :cond_1
    aget-object v0, p1, v2

    .line 103
    .line 104
    invoke-virtual {p0, v0}, Ly10;->l(Ljava/util/HashMap;)Z

    .line 105
    .line 106
    .line 107
    iget v0, p0, Ly10;->b:I

    .line 108
    .line 109
    const/16 v1, 0x8

    .line 110
    .line 111
    if-ne v0, v1, :cond_2

    .line 112
    .line 113
    aget-object v0, p1, v3

    .line 114
    .line 115
    const-string v1, "MakerNote"

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    check-cast v0, Lv10;

    .line 122
    .line 123
    if-eqz v0, :cond_2

    .line 124
    .line 125
    new-instance v1, Lu10;

    .line 126
    .line 127
    iget-object v0, v0, Lv10;->c:[B

    .line 128
    .line 129
    invoke-direct {v1, v0}, Lu10;-><init>([B)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 133
    .line 134
    iput-object v0, v1, Lu10;->k:Ljava/nio/ByteOrder;

    .line 135
    .line 136
    const-wide/16 v4, 0x6

    .line 137
    .line 138
    invoke-virtual {v1, v4, v5}, Lu10;->a(J)V

    .line 139
    .line 140
    .line 141
    const/16 v0, 0x9

    .line 142
    .line 143
    invoke-virtual {p0, v1, v0}, Ly10;->p(Lu10;I)V

    .line 144
    .line 145
    .line 146
    aget-object p0, p1, v0

    .line 147
    .line 148
    const-string v0, "ColorSpace"

    .line 149
    .line 150
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    check-cast p0, Lv10;

    .line 155
    .line 156
    if-eqz p0, :cond_2

    .line 157
    .line 158
    aget-object p1, p1, v3

    .line 159
    .line 160
    invoke-virtual {p1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    :cond_2
    return-void
.end method

.method public final j(Lu10;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Ly10;->i(Lu10;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ly10;->c:[Ljava/util/HashMap;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    aget-object v2, v0, v1

    .line 8
    .line 9
    const-string v3, "JpgFromRaw"

    .line 10
    .line 11
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, Lv10;

    .line 16
    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    iget v2, p0, Ly10;->j:I

    .line 20
    .line 21
    const/4 v3, 0x5

    .line 22
    invoke-virtual {p0, p1, v2, v3}, Ly10;->e(Lu10;II)V

    .line 23
    .line 24
    .line 25
    :cond_0
    aget-object p0, v0, v1

    .line 26
    .line 27
    const-string p1, "ISO"

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lv10;

    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    aget-object v1, v0, p1

    .line 37
    .line 38
    const-string v2, "PhotographicSensitivity"

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Lv10;

    .line 45
    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    if-nez v1, :cond_1

    .line 49
    .line 50
    aget-object p1, v0, p1

    .line 51
    .line 52
    invoke-virtual {p1, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public final k(Lu10;Ljava/util/HashMap;)V
    .locals 3

    .line 1
    const-string v0, "JPEGInterchangeFormat"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv10;

    .line 8
    .line 9
    const-string v1, "JPEGInterchangeFormatLength"

    .line 10
    .line 11
    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Lv10;

    .line 16
    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    if-eqz p2, :cond_3

    .line 20
    .line 21
    iget-object v1, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lv10;->e(Ljava/nio/ByteOrder;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v1, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 28
    .line 29
    invoke-virtual {p2, v1}, Lv10;->e(Ljava/nio/ByteOrder;)I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    iget-object v1, p1, Lu10;->j:Ljava/io/DataInputStream;

    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/io/InputStream;->available()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    sub-int/2addr v1, v0

    .line 40
    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    iget v1, p0, Ly10;->b:I

    .line 45
    .line 46
    const/4 v2, 0x4

    .line 47
    if-eq v1, v2, :cond_1

    .line 48
    .line 49
    const/16 v2, 0x9

    .line 50
    .line 51
    if-eq v1, v2, :cond_1

    .line 52
    .line 53
    const/16 v2, 0xa

    .line 54
    .line 55
    if-ne v1, v2, :cond_0

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_0
    const/4 v2, 0x7

    .line 59
    if-ne v1, v2, :cond_2

    .line 60
    .line 61
    iget v1, p0, Ly10;->g:I

    .line 62
    .line 63
    :goto_0
    add-int/2addr v0, v1

    .line 64
    goto :goto_2

    .line 65
    :cond_1
    :goto_1
    iget v1, p0, Ly10;->f:I

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    :goto_2
    if-lez v0, :cond_3

    .line 69
    .line 70
    if-lez p2, :cond_3

    .line 71
    .line 72
    iget-object p0, p0, Ly10;->a:Ljava/lang/String;

    .line 73
    .line 74
    if-nez p0, :cond_3

    .line 75
    .line 76
    new-array p0, p2, [B

    .line 77
    .line 78
    int-to-long v0, v0

    .line 79
    invoke-virtual {p1, v0, v1}, Lu10;->a(J)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, p0}, Lu10;->readFully([B)V

    .line 83
    .line 84
    .line 85
    :cond_3
    return-void
.end method

.method public final l(Ljava/util/HashMap;)Z
    .locals 2

    .line 1
    const-string v0, "ImageLength"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv10;

    .line 8
    .line 9
    const-string v1, "ImageWidth"

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lv10;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lv10;->e(Ljava/nio/ByteOrder;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object p0, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Lv10;->e(Ljava/nio/ByteOrder;)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    const/16 p1, 0x200

    .line 34
    .line 35
    if-gt v0, p1, :cond_0

    .line 36
    .line 37
    if-gt p0, p1, :cond_0

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public final m(Ljava/io/FileInputStream;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    :try_start_0
    sget-object v2, Ly10;->t:[[Lw10;

    .line 4
    .line 5
    array-length v2, v2

    .line 6
    if-ge v1, v2, :cond_0

    .line 7
    .line 8
    iget-object v2, p0, Ly10;->c:[Ljava/util/HashMap;

    .line 9
    .line 10
    new-instance v3, Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    aput-object v3, v2, v1

    .line 16
    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    goto :goto_2

    .line 22
    :cond_0
    new-instance v1, Ljava/io/BufferedInputStream;

    .line 23
    .line 24
    const/16 v2, 0x1388

    .line 25
    .line 26
    invoke-direct {v1, p1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v1}, Ly10;->f(Ljava/io/BufferedInputStream;)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput p1, p0, Ly10;->b:I

    .line 34
    .line 35
    new-instance p1, Lu10;

    .line 36
    .line 37
    invoke-direct {p1, v1}, Lu10;-><init>(Ljava/io/InputStream;)V

    .line 38
    .line 39
    .line 40
    iget v1, p0, Ly10;->b:I

    .line 41
    .line 42
    packed-switch v1, :pswitch_data_0

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :pswitch_0
    invoke-virtual {p0, p1}, Ly10;->j(Lu10;)V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :pswitch_1
    invoke-virtual {p0, p1}, Ly10;->h(Lu10;)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :pswitch_2
    invoke-virtual {p0, p1}, Ly10;->g(Lu10;)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :pswitch_3
    invoke-virtual {p0, p1, v0, v0}, Ly10;->e(Lu10;II)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :pswitch_4
    invoke-virtual {p0, p1}, Ly10;->i(Lu10;)V

    .line 63
    .line 64
    .line 65
    :goto_1
    invoke-virtual {p0, p1}, Ly10;->q(Lu10;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ly10;->a()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :goto_2
    invoke-virtual {p0}, Ly10;->a()V

    .line 73
    .line 74
    .line 75
    throw p1

    .line 76
    :catch_0
    invoke-virtual {p0}, Ly10;->a()V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    nop

    .line 81
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_2
        :pswitch_4
        :pswitch_1
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method public final n(Lu10;I)V
    .locals 2

    .line 1
    invoke-static {p1}, Ly10;->o(Lu10;)Ljava/nio/ByteOrder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 6
    .line 7
    iput-object v0, p1, Lu10;->k:Ljava/nio/ByteOrder;

    .line 8
    .line 9
    invoke-virtual {p1}, Lu10;->readUnsignedShort()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget p0, p0, Ly10;->b:I

    .line 14
    .line 15
    const/4 v1, 0x7

    .line 16
    if-eq p0, v1, :cond_1

    .line 17
    .line 18
    const/16 v1, 0xa

    .line 19
    .line 20
    if-eq p0, v1, :cond_1

    .line 21
    .line 22
    const/16 p0, 0x2a

    .line 23
    .line 24
    if-ne v0, p0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string p0, "Invalid start code: "

    .line 28
    .line 29
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1, p0}, Lz0;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lu10;->readInt()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    const/16 v0, 0x8

    .line 42
    .line 43
    if-lt p0, v0, :cond_4

    .line 44
    .line 45
    if-ge p0, p2, :cond_4

    .line 46
    .line 47
    add-int/lit8 p0, p0, -0x8

    .line 48
    .line 49
    if-lez p0, :cond_3

    .line 50
    .line 51
    invoke-virtual {p1, p0}, Lu10;->skipBytes(I)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-ne p1, p0, :cond_2

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    const-string p1, "Couldn\'t jump to first Ifd: "

    .line 59
    .line 60
    invoke-static {p0, p1}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_3
    :goto_1
    return-void

    .line 68
    :cond_4
    const-string p1, "Invalid first Ifd offset: "

    .line 69
    .line 70
    invoke-static {p0, p1}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {p0}, Lo40;->k(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final p(Lu10;I)V
    .locals 26

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    iget v3, v1, Lu10;->m:I

    .line 8
    .line 9
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    iget-object v4, v0, Ly10;->d:Ljava/util/HashSet;

    .line 14
    .line 15
    invoke-virtual {v4, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    iget v3, v1, Lu10;->m:I

    .line 19
    .line 20
    add-int/lit8 v3, v3, 0x2

    .line 21
    .line 22
    iget v5, v1, Lu10;->l:I

    .line 23
    .line 24
    if-le v3, v5, :cond_0

    .line 25
    .line 26
    goto/16 :goto_10

    .line 27
    .line 28
    :cond_0
    invoke-virtual {v1}, Lu10;->readShort()S

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    iget v6, v1, Lu10;->m:I

    .line 33
    .line 34
    mul-int/lit8 v7, v3, 0xc

    .line 35
    .line 36
    add-int/2addr v7, v6

    .line 37
    if-gt v7, v5, :cond_26

    .line 38
    .line 39
    if-gtz v3, :cond_1

    .line 40
    .line 41
    goto/16 :goto_10

    .line 42
    .line 43
    :cond_1
    const/4 v7, 0x0

    .line 44
    :goto_0
    iget-object v10, v0, Ly10;->c:[Ljava/util/HashMap;

    .line 45
    .line 46
    if-ge v7, v3, :cond_24

    .line 47
    .line 48
    invoke-virtual {v1}, Lu10;->readUnsignedShort()I

    .line 49
    .line 50
    .line 51
    move-result v12

    .line 52
    invoke-virtual {v1}, Lu10;->readUnsignedShort()I

    .line 53
    .line 54
    .line 55
    move-result v13

    .line 56
    invoke-virtual {v1}, Lu10;->readInt()I

    .line 57
    .line 58
    .line 59
    move-result v14

    .line 60
    iget v15, v1, Lu10;->m:I

    .line 61
    .line 62
    move/from16 v16, v7

    .line 63
    .line 64
    int-to-long v6, v15

    .line 65
    const-wide/16 v17, 0x4

    .line 66
    .line 67
    add-long v6, v6, v17

    .line 68
    .line 69
    sget-object v15, Ly10;->v:[Ljava/util/HashMap;

    .line 70
    .line 71
    aget-object v15, v15, v2

    .line 72
    .line 73
    const-wide/16 v19, 0x0

    .line 74
    .line 75
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v8

    .line 79
    invoke-virtual {v15, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v8

    .line 83
    check-cast v8, Lw10;

    .line 84
    .line 85
    const/4 v9, 0x7

    .line 86
    if-nez v8, :cond_3

    .line 87
    .line 88
    :cond_2
    :goto_1
    move/from16 v23, v3

    .line 89
    .line 90
    :goto_2
    move-object v3, v10

    .line 91
    goto/16 :goto_9

    .line 92
    .line 93
    :cond_3
    if-lez v13, :cond_2

    .line 94
    .line 95
    sget-object v15, Ly10;->q:[I

    .line 96
    .line 97
    array-length v11, v15

    .line 98
    if-lt v13, v11, :cond_4

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_4
    iget v11, v8, Lw10;->c:I

    .line 102
    .line 103
    if-eq v11, v9, :cond_6

    .line 104
    .line 105
    if-ne v13, v9, :cond_5

    .line 106
    .line 107
    goto :goto_3

    .line 108
    :cond_5
    if-eq v11, v13, :cond_6

    .line 109
    .line 110
    iget v9, v8, Lw10;->d:I

    .line 111
    .line 112
    if-ne v9, v13, :cond_7

    .line 113
    .line 114
    :cond_6
    :goto_3
    move/from16 v23, v3

    .line 115
    .line 116
    goto :goto_5

    .line 117
    :cond_7
    move/from16 v23, v3

    .line 118
    .line 119
    const/4 v3, 0x4

    .line 120
    if-eq v11, v3, :cond_8

    .line 121
    .line 122
    if-ne v9, v3, :cond_9

    .line 123
    .line 124
    :cond_8
    const/4 v3, 0x3

    .line 125
    goto :goto_4

    .line 126
    :cond_9
    const/16 v3, 0x9

    .line 127
    .line 128
    goto :goto_6

    .line 129
    :goto_4
    if-ne v13, v3, :cond_9

    .line 130
    .line 131
    :goto_5
    const/4 v3, 0x7

    .line 132
    goto :goto_7

    .line 133
    :goto_6
    if-eq v11, v3, :cond_a

    .line 134
    .line 135
    if-ne v9, v3, :cond_b

    .line 136
    .line 137
    :cond_a
    const/16 v3, 0x8

    .line 138
    .line 139
    if-ne v13, v3, :cond_b

    .line 140
    .line 141
    goto :goto_5

    .line 142
    :cond_b
    const/16 v3, 0xc

    .line 143
    .line 144
    if-eq v11, v3, :cond_c

    .line 145
    .line 146
    if-ne v9, v3, :cond_d

    .line 147
    .line 148
    :cond_c
    const/16 v3, 0xb

    .line 149
    .line 150
    if-ne v13, v3, :cond_d

    .line 151
    .line 152
    goto :goto_5

    .line 153
    :cond_d
    sget-object v3, Ly10;->p:[Ljava/lang/String;

    .line 154
    .line 155
    aget-object v3, v3, v13

    .line 156
    .line 157
    goto :goto_2

    .line 158
    :goto_7
    if-ne v13, v3, :cond_e

    .line 159
    .line 160
    move v13, v11

    .line 161
    :cond_e
    move-object v3, v10

    .line 162
    int-to-long v9, v14

    .line 163
    aget v11, v15, v13

    .line 164
    .line 165
    move-wide/from16 v24, v9

    .line 166
    .line 167
    int-to-long v9, v11

    .line 168
    mul-long v9, v9, v24

    .line 169
    .line 170
    cmp-long v11, v9, v19

    .line 171
    .line 172
    if-ltz v11, :cond_10

    .line 173
    .line 174
    const-wide/32 v24, 0x7fffffff

    .line 175
    .line 176
    .line 177
    cmp-long v11, v9, v24

    .line 178
    .line 179
    if-lez v11, :cond_f

    .line 180
    .line 181
    goto :goto_8

    .line 182
    :cond_f
    const/4 v11, 0x1

    .line 183
    goto :goto_a

    .line 184
    :cond_10
    :goto_8
    const/4 v11, 0x0

    .line 185
    goto :goto_a

    .line 186
    :goto_9
    move-wide/from16 v9, v19

    .line 187
    .line 188
    goto :goto_8

    .line 189
    :goto_a
    if-nez v11, :cond_11

    .line 190
    .line 191
    invoke-virtual {v1, v6, v7}, Lu10;->a(J)V

    .line 192
    .line 193
    .line 194
    goto/16 :goto_f

    .line 195
    .line 196
    :cond_11
    cmp-long v11, v9, v17

    .line 197
    .line 198
    const-string v15, "Compression"

    .line 199
    .line 200
    if-lez v11, :cond_17

    .line 201
    .line 202
    invoke-virtual {v1}, Lu10;->readInt()I

    .line 203
    .line 204
    .line 205
    move-result v11

    .line 206
    move-object/from16 v17, v3

    .line 207
    .line 208
    iget v3, v0, Ly10;->b:I

    .line 209
    .line 210
    move/from16 v18, v12

    .line 211
    .line 212
    const/4 v12, 0x7

    .line 213
    if-ne v3, v12, :cond_14

    .line 214
    .line 215
    const-string v3, "MakerNote"

    .line 216
    .line 217
    iget-object v12, v8, Lw10;->b:Ljava/lang/String;

    .line 218
    .line 219
    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result v3

    .line 223
    if-eqz v3, :cond_13

    .line 224
    .line 225
    iput v11, v0, Ly10;->g:I

    .line 226
    .line 227
    :cond_12
    move-wide/from16 v24, v9

    .line 228
    .line 229
    move/from16 v22, v13

    .line 230
    .line 231
    goto :goto_b

    .line 232
    :cond_13
    const/4 v3, 0x6

    .line 233
    if-ne v2, v3, :cond_12

    .line 234
    .line 235
    const-string v12, "ThumbnailImage"

    .line 236
    .line 237
    iget-object v3, v8, Lw10;->b:Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {v12, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result v3

    .line 243
    if-eqz v3, :cond_12

    .line 244
    .line 245
    iput v11, v0, Ly10;->h:I

    .line 246
    .line 247
    iput v14, v0, Ly10;->i:I

    .line 248
    .line 249
    iget-object v3, v0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 250
    .line 251
    const/4 v12, 0x6

    .line 252
    invoke-static {v12, v3}, Lv10;->c(ILjava/nio/ByteOrder;)Lv10;

    .line 253
    .line 254
    .line 255
    move-result-object v3

    .line 256
    iget v12, v0, Ly10;->h:I

    .line 257
    .line 258
    move-wide/from16 v24, v9

    .line 259
    .line 260
    int-to-long v9, v12

    .line 261
    iget-object v12, v0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 262
    .line 263
    invoke-static {v9, v10, v12}, Lv10;->a(JLjava/nio/ByteOrder;)Lv10;

    .line 264
    .line 265
    .line 266
    move-result-object v9

    .line 267
    iget v10, v0, Ly10;->i:I

    .line 268
    .line 269
    move/from16 v22, v13

    .line 270
    .line 271
    int-to-long v12, v10

    .line 272
    iget-object v10, v0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 273
    .line 274
    invoke-static {v12, v13, v10}, Lv10;->a(JLjava/nio/ByteOrder;)Lv10;

    .line 275
    .line 276
    .line 277
    move-result-object v10

    .line 278
    const/16 v21, 0x4

    .line 279
    .line 280
    aget-object v12, v17, v21

    .line 281
    .line 282
    invoke-virtual {v12, v15, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    aget-object v3, v17, v21

    .line 286
    .line 287
    const-string v12, "JPEGInterchangeFormat"

    .line 288
    .line 289
    invoke-virtual {v3, v12, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    aget-object v3, v17, v21

    .line 293
    .line 294
    const-string v9, "JPEGInterchangeFormatLength"

    .line 295
    .line 296
    invoke-virtual {v3, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    .line 298
    .line 299
    goto :goto_b

    .line 300
    :cond_14
    move-wide/from16 v24, v9

    .line 301
    .line 302
    move/from16 v22, v13

    .line 303
    .line 304
    const/16 v9, 0xa

    .line 305
    .line 306
    if-ne v3, v9, :cond_15

    .line 307
    .line 308
    const-string v3, "JpgFromRaw"

    .line 309
    .line 310
    iget-object v9, v8, Lw10;->b:Ljava/lang/String;

    .line 311
    .line 312
    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 313
    .line 314
    .line 315
    move-result v3

    .line 316
    if-eqz v3, :cond_15

    .line 317
    .line 318
    iput v11, v0, Ly10;->j:I

    .line 319
    .line 320
    :cond_15
    :goto_b
    int-to-long v9, v11

    .line 321
    add-long v11, v9, v24

    .line 322
    .line 323
    int-to-long v2, v5

    .line 324
    cmp-long v2, v11, v2

    .line 325
    .line 326
    if-gtz v2, :cond_16

    .line 327
    .line 328
    invoke-virtual {v1, v9, v10}, Lu10;->a(J)V

    .line 329
    .line 330
    .line 331
    goto :goto_c

    .line 332
    :cond_16
    invoke-virtual {v1, v6, v7}, Lu10;->a(J)V

    .line 333
    .line 334
    .line 335
    goto/16 :goto_f

    .line 336
    .line 337
    :cond_17
    move-object/from16 v17, v3

    .line 338
    .line 339
    move-wide/from16 v24, v9

    .line 340
    .line 341
    move/from16 v18, v12

    .line 342
    .line 343
    move/from16 v22, v13

    .line 344
    .line 345
    :goto_c
    sget-object v2, Ly10;->y:Ljava/util/HashMap;

    .line 346
    .line 347
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 348
    .line 349
    .line 350
    move-result-object v3

    .line 351
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    .line 353
    .line 354
    move-result-object v2

    .line 355
    check-cast v2, Ljava/lang/Integer;

    .line 356
    .line 357
    if-eqz v2, :cond_1d

    .line 358
    .line 359
    move/from16 v13, v22

    .line 360
    .line 361
    const/4 v3, 0x3

    .line 362
    if-eq v13, v3, :cond_1b

    .line 363
    .line 364
    const/4 v3, 0x4

    .line 365
    if-eq v13, v3, :cond_1a

    .line 366
    .line 367
    const/16 v3, 0x8

    .line 368
    .line 369
    if-eq v13, v3, :cond_19

    .line 370
    .line 371
    const/16 v3, 0x9

    .line 372
    .line 373
    if-eq v13, v3, :cond_18

    .line 374
    .line 375
    const/16 v3, 0xd

    .line 376
    .line 377
    if-eq v13, v3, :cond_18

    .line 378
    .line 379
    const-wide/16 v8, -0x1

    .line 380
    .line 381
    goto :goto_e

    .line 382
    :cond_18
    invoke-virtual {v1}, Lu10;->readInt()I

    .line 383
    .line 384
    .line 385
    move-result v3

    .line 386
    :goto_d
    int-to-long v8, v3

    .line 387
    goto :goto_e

    .line 388
    :cond_19
    invoke-virtual {v1}, Lu10;->readShort()S

    .line 389
    .line 390
    .line 391
    move-result v3

    .line 392
    goto :goto_d

    .line 393
    :cond_1a
    invoke-virtual {v1}, Lu10;->readInt()I

    .line 394
    .line 395
    .line 396
    move-result v3

    .line 397
    int-to-long v8, v3

    .line 398
    const-wide v10, 0xffffffffL

    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    and-long/2addr v8, v10

    .line 404
    goto :goto_e

    .line 405
    :cond_1b
    invoke-virtual {v1}, Lu10;->readUnsignedShort()I

    .line 406
    .line 407
    .line 408
    move-result v3

    .line 409
    goto :goto_d

    .line 410
    :goto_e
    cmp-long v3, v8, v19

    .line 411
    .line 412
    if-lez v3, :cond_1c

    .line 413
    .line 414
    int-to-long v10, v5

    .line 415
    cmp-long v3, v8, v10

    .line 416
    .line 417
    if-gez v3, :cond_1c

    .line 418
    .line 419
    long-to-int v3, v8

    .line 420
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 421
    .line 422
    .line 423
    move-result-object v3

    .line 424
    invoke-virtual {v4, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 425
    .line 426
    .line 427
    move-result v3

    .line 428
    if-nez v3, :cond_1c

    .line 429
    .line 430
    invoke-virtual {v1, v8, v9}, Lu10;->a(J)V

    .line 431
    .line 432
    .line 433
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 434
    .line 435
    .line 436
    move-result v2

    .line 437
    invoke-virtual {v0, v1, v2}, Ly10;->p(Lu10;I)V

    .line 438
    .line 439
    .line 440
    :cond_1c
    invoke-virtual {v1, v6, v7}, Lu10;->a(J)V

    .line 441
    .line 442
    .line 443
    goto :goto_f

    .line 444
    :cond_1d
    move/from16 v13, v22

    .line 445
    .line 446
    move-wide/from16 v9, v24

    .line 447
    .line 448
    long-to-int v2, v9

    .line 449
    new-array v2, v2, [B

    .line 450
    .line 451
    invoke-virtual {v1, v2}, Lu10;->readFully([B)V

    .line 452
    .line 453
    .line 454
    new-instance v3, Lv10;

    .line 455
    .line 456
    invoke-direct {v3, v2, v13, v14}, Lv10;-><init>([BII)V

    .line 457
    .line 458
    .line 459
    aget-object v2, v17, p2

    .line 460
    .line 461
    iget-object v8, v8, Lw10;->b:Ljava/lang/String;

    .line 462
    .line 463
    invoke-virtual {v2, v8, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 464
    .line 465
    .line 466
    const-string v2, "DNGVersion"

    .line 467
    .line 468
    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 469
    .line 470
    .line 471
    move-result v2

    .line 472
    if-eqz v2, :cond_1e

    .line 473
    .line 474
    const/4 v2, 0x3

    .line 475
    iput v2, v0, Ly10;->b:I

    .line 476
    .line 477
    :cond_1e
    const-string v2, "Make"

    .line 478
    .line 479
    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 480
    .line 481
    .line 482
    move-result v2

    .line 483
    if-nez v2, :cond_1f

    .line 484
    .line 485
    const-string v2, "Model"

    .line 486
    .line 487
    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 488
    .line 489
    .line 490
    move-result v2

    .line 491
    if-eqz v2, :cond_20

    .line 492
    .line 493
    :cond_1f
    iget-object v2, v0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 494
    .line 495
    invoke-virtual {v3, v2}, Lv10;->f(Ljava/nio/ByteOrder;)Ljava/lang/String;

    .line 496
    .line 497
    .line 498
    move-result-object v2

    .line 499
    const-string v9, "PENTAX"

    .line 500
    .line 501
    invoke-virtual {v2, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 502
    .line 503
    .line 504
    move-result v2

    .line 505
    if-nez v2, :cond_21

    .line 506
    .line 507
    :cond_20
    invoke-virtual {v15, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 508
    .line 509
    .line 510
    move-result v2

    .line 511
    if-eqz v2, :cond_22

    .line 512
    .line 513
    iget-object v2, v0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 514
    .line 515
    invoke-virtual {v3, v2}, Lv10;->e(Ljava/nio/ByteOrder;)I

    .line 516
    .line 517
    .line 518
    move-result v2

    .line 519
    const v3, 0xffff

    .line 520
    .line 521
    .line 522
    if-ne v2, v3, :cond_22

    .line 523
    .line 524
    :cond_21
    const/16 v3, 0x8

    .line 525
    .line 526
    iput v3, v0, Ly10;->b:I

    .line 527
    .line 528
    :cond_22
    iget v2, v1, Lu10;->m:I

    .line 529
    .line 530
    int-to-long v2, v2

    .line 531
    cmp-long v2, v2, v6

    .line 532
    .line 533
    if-eqz v2, :cond_23

    .line 534
    .line 535
    invoke-virtual {v1, v6, v7}, Lu10;->a(J)V

    .line 536
    .line 537
    .line 538
    :cond_23
    :goto_f
    add-int/lit8 v7, v16, 0x1

    .line 539
    .line 540
    int-to-short v7, v7

    .line 541
    move/from16 v2, p2

    .line 542
    .line 543
    move/from16 v3, v23

    .line 544
    .line 545
    goto/16 :goto_0

    .line 546
    .line 547
    :cond_24
    move-object/from16 v17, v10

    .line 548
    .line 549
    const-wide/16 v19, 0x0

    .line 550
    .line 551
    iget v2, v1, Lu10;->m:I

    .line 552
    .line 553
    const/4 v3, 0x4

    .line 554
    add-int/2addr v2, v3

    .line 555
    if-gt v2, v5, :cond_26

    .line 556
    .line 557
    invoke-virtual {v1}, Lu10;->readInt()I

    .line 558
    .line 559
    .line 560
    move-result v2

    .line 561
    int-to-long v6, v2

    .line 562
    cmp-long v8, v6, v19

    .line 563
    .line 564
    if-lez v8, :cond_26

    .line 565
    .line 566
    if-ge v2, v5, :cond_26

    .line 567
    .line 568
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 569
    .line 570
    .line 571
    move-result-object v2

    .line 572
    invoke-virtual {v4, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 573
    .line 574
    .line 575
    move-result v2

    .line 576
    if-nez v2, :cond_26

    .line 577
    .line 578
    invoke-virtual {v1, v6, v7}, Lu10;->a(J)V

    .line 579
    .line 580
    .line 581
    aget-object v2, v17, v3

    .line 582
    .line 583
    invoke-virtual {v2}, Ljava/util/HashMap;->isEmpty()Z

    .line 584
    .line 585
    .line 586
    move-result v2

    .line 587
    if-eqz v2, :cond_25

    .line 588
    .line 589
    invoke-virtual {v0, v1, v3}, Ly10;->p(Lu10;I)V

    .line 590
    .line 591
    .line 592
    return-void

    .line 593
    :cond_25
    const/4 v2, 0x5

    .line 594
    aget-object v3, v17, v2

    .line 595
    .line 596
    invoke-virtual {v3}, Ljava/util/HashMap;->isEmpty()Z

    .line 597
    .line 598
    .line 599
    move-result v3

    .line 600
    if-eqz v3, :cond_26

    .line 601
    .line 602
    invoke-virtual {v0, v1, v2}, Ly10;->p(Lu10;I)V

    .line 603
    .line 604
    .line 605
    :cond_26
    :goto_10
    return-void
.end method

.method public final q(Lu10;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ly10;->c:[Ljava/util/HashMap;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    aget-object v0, v0, v1

    .line 5
    .line 6
    const-string v1, "Compression"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lv10;

    .line 13
    .line 14
    if-eqz v1, :cond_9

    .line 15
    .line 16
    iget-object v2, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Lv10;->e(Ljava/nio/ByteOrder;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/4 v2, 0x6

    .line 23
    const/4 v3, 0x1

    .line 24
    if-eq v1, v3, :cond_1

    .line 25
    .line 26
    if-eq v1, v2, :cond_0

    .line 27
    .line 28
    const/4 v4, 0x7

    .line 29
    if-eq v1, v4, :cond_1

    .line 30
    .line 31
    goto/16 :goto_3

    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0, p1, v0}, Ly10;->k(Lu10;Ljava/util/HashMap;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    const-string v1, "BitsPerSample"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lv10;

    .line 44
    .line 45
    if-eqz v1, :cond_8

    .line 46
    .line 47
    iget-object v4, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 48
    .line 49
    invoke-virtual {v1, v4}, Lv10;->g(Ljava/nio/ByteOrder;)Ljava/io/Serializable;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, [I

    .line 54
    .line 55
    sget-object v4, Ly10;->k:[I

    .line 56
    .line 57
    invoke-static {v4, v1}, Ljava/util/Arrays;->equals([I[I)Z

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    if-eqz v5, :cond_2

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    iget v5, p0, Ly10;->b:I

    .line 65
    .line 66
    const/4 v6, 0x3

    .line 67
    if-ne v5, v6, :cond_8

    .line 68
    .line 69
    const-string v5, "PhotometricInterpretation"

    .line 70
    .line 71
    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    check-cast v5, Lv10;

    .line 76
    .line 77
    if-eqz v5, :cond_8

    .line 78
    .line 79
    iget-object v6, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 80
    .line 81
    invoke-virtual {v5, v6}, Lv10;->e(Ljava/nio/ByteOrder;)I

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    if-ne v5, v3, :cond_3

    .line 86
    .line 87
    sget-object v3, Ly10;->l:[I

    .line 88
    .line 89
    invoke-static {v1, v3}, Ljava/util/Arrays;->equals([I[I)Z

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    if-nez v3, :cond_4

    .line 94
    .line 95
    :cond_3
    if-ne v5, v2, :cond_8

    .line 96
    .line 97
    invoke-static {v1, v4}, Ljava/util/Arrays;->equals([I[I)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_8

    .line 102
    .line 103
    :cond_4
    :goto_0
    const-string v1, "StripOffsets"

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    check-cast v1, Lv10;

    .line 110
    .line 111
    const-string v2, "StripByteCounts"

    .line 112
    .line 113
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Lv10;

    .line 118
    .line 119
    if-eqz v1, :cond_8

    .line 120
    .line 121
    if-eqz v0, :cond_8

    .line 122
    .line 123
    iget-object v2, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 124
    .line 125
    invoke-virtual {v1, v2}, Lv10;->g(Ljava/nio/ByteOrder;)Ljava/io/Serializable;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-static {v1}, Ly10;->b(Ljava/io/Serializable;)[J

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    iget-object p0, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 134
    .line 135
    invoke-virtual {v0, p0}, Lv10;->g(Ljava/nio/ByteOrder;)Ljava/io/Serializable;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-static {p0}, Ly10;->b(Ljava/io/Serializable;)[J

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    if-nez v1, :cond_5

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_5
    if-nez p0, :cond_6

    .line 147
    .line 148
    goto :goto_3

    .line 149
    :cond_6
    array-length v0, p0

    .line 150
    const/4 v2, 0x0

    .line 151
    const-wide/16 v3, 0x0

    .line 152
    .line 153
    move v5, v2

    .line 154
    :goto_1
    if-ge v5, v0, :cond_7

    .line 155
    .line 156
    aget-wide v6, p0, v5

    .line 157
    .line 158
    add-long/2addr v3, v6

    .line 159
    add-int/lit8 v5, v5, 0x1

    .line 160
    .line 161
    goto :goto_1

    .line 162
    :cond_7
    long-to-int v0, v3

    .line 163
    new-array v0, v0, [B

    .line 164
    .line 165
    move v3, v2

    .line 166
    move v4, v3

    .line 167
    move v5, v4

    .line 168
    :goto_2
    array-length v6, v1

    .line 169
    if-ge v3, v6, :cond_8

    .line 170
    .line 171
    aget-wide v6, v1, v3

    .line 172
    .line 173
    long-to-int v6, v6

    .line 174
    aget-wide v7, p0, v3

    .line 175
    .line 176
    long-to-int v7, v7

    .line 177
    sub-int/2addr v6, v4

    .line 178
    int-to-long v8, v6

    .line 179
    invoke-virtual {p1, v8, v9}, Lu10;->a(J)V

    .line 180
    .line 181
    .line 182
    add-int/2addr v4, v6

    .line 183
    new-array v6, v7, [B

    .line 184
    .line 185
    invoke-virtual {p1, v6}, Ljava/io/InputStream;->read([B)I

    .line 186
    .line 187
    .line 188
    add-int/2addr v4, v7

    .line 189
    invoke-static {v6, v2, v0, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 190
    .line 191
    .line 192
    add-int/2addr v5, v7

    .line 193
    add-int/lit8 v3, v3, 0x1

    .line 194
    .line 195
    goto :goto_2

    .line 196
    :cond_8
    :goto_3
    return-void

    .line 197
    :cond_9
    invoke-virtual {p0, p1, v0}, Ly10;->k(Lu10;Ljava/util/HashMap;)V

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public final r(II)V
    .locals 6

    .line 1
    iget-object v0, p0, Ly10;->c:[Ljava/util/HashMap;

    .line 2
    .line 3
    aget-object v1, v0, p1

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_3

    .line 10
    .line 11
    aget-object v1, v0, p2

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    aget-object v1, v0, p1

    .line 21
    .line 22
    const-string v2, "ImageLength"

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Lv10;

    .line 29
    .line 30
    aget-object v3, v0, p1

    .line 31
    .line 32
    const-string v4, "ImageWidth"

    .line 33
    .line 34
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Lv10;

    .line 39
    .line 40
    aget-object v5, v0, p2

    .line 41
    .line 42
    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Lv10;

    .line 47
    .line 48
    aget-object v5, v0, p2

    .line 49
    .line 50
    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    check-cast v4, Lv10;

    .line 55
    .line 56
    if-eqz v1, :cond_3

    .line 57
    .line 58
    if-nez v3, :cond_1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    if-eqz v2, :cond_3

    .line 62
    .line 63
    if-nez v4, :cond_2

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    iget-object v5, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 67
    .line 68
    invoke-virtual {v1, v5}, Lv10;->e(Ljava/nio/ByteOrder;)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    iget-object v5, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 73
    .line 74
    invoke-virtual {v3, v5}, Lv10;->e(Ljava/nio/ByteOrder;)I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    iget-object v5, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 79
    .line 80
    invoke-virtual {v2, v5}, Lv10;->e(Ljava/nio/ByteOrder;)I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    iget-object p0, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 85
    .line 86
    invoke-virtual {v4, p0}, Lv10;->e(Ljava/nio/ByteOrder;)I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-ge v1, v2, :cond_3

    .line 91
    .line 92
    if-ge v3, p0, :cond_3

    .line 93
    .line 94
    aget-object p0, v0, p1

    .line 95
    .line 96
    aget-object v1, v0, p2

    .line 97
    .line 98
    aput-object v1, v0, p1

    .line 99
    .line 100
    aput-object p0, v0, p2

    .line 101
    .line 102
    :cond_3
    :goto_0
    return-void
.end method

.method public final s(Lu10;I)V
    .locals 9

    .line 1
    iget-object v0, p0, Ly10;->c:[Ljava/util/HashMap;

    .line 2
    .line 3
    aget-object v1, v0, p2

    .line 4
    .line 5
    const-string v2, "DefaultCropSize"

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lv10;

    .line 12
    .line 13
    aget-object v2, v0, p2

    .line 14
    .line 15
    const-string v3, "SensorTopBorder"

    .line 16
    .line 17
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lv10;

    .line 22
    .line 23
    aget-object v3, v0, p2

    .line 24
    .line 25
    const-string v4, "SensorLeftBorder"

    .line 26
    .line 27
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lv10;

    .line 32
    .line 33
    aget-object v4, v0, p2

    .line 34
    .line 35
    const-string v5, "SensorBottomBorder"

    .line 36
    .line 37
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    check-cast v4, Lv10;

    .line 42
    .line 43
    aget-object v5, v0, p2

    .line 44
    .line 45
    const-string v6, "SensorRightBorder"

    .line 46
    .line 47
    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    check-cast v5, Lv10;

    .line 52
    .line 53
    const-string v6, "ImageLength"

    .line 54
    .line 55
    const-string v7, "ImageWidth"

    .line 56
    .line 57
    if-eqz v1, :cond_5

    .line 58
    .line 59
    iget p1, v1, Lv10;->a:I

    .line 60
    .line 61
    iget-object v2, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 62
    .line 63
    const/4 v3, 0x1

    .line 64
    const/4 v4, 0x0

    .line 65
    const/4 v5, 0x2

    .line 66
    const/4 v8, 0x5

    .line 67
    if-ne p1, v8, :cond_2

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Lv10;->g(Ljava/nio/ByteOrder;)Ljava/io/Serializable;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    check-cast p1, [Lx10;

    .line 74
    .line 75
    if-eqz p1, :cond_1

    .line 76
    .line 77
    array-length v1, p1

    .line 78
    if-eq v1, v5, :cond_0

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_0
    aget-object v1, p1, v4

    .line 82
    .line 83
    iget-object v2, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 84
    .line 85
    invoke-static {v1, v2}, Lv10;->b(Lx10;Ljava/nio/ByteOrder;)Lv10;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    aget-object p1, p1, v3

    .line 90
    .line 91
    iget-object p0, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 92
    .line 93
    invoke-static {p1, p0}, Lv10;->b(Lx10;Ljava/nio/ByteOrder;)Lv10;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    goto :goto_1

    .line 98
    :cond_1
    :goto_0
    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_2
    invoke-virtual {v1, v2}, Lv10;->g(Ljava/nio/ByteOrder;)Ljava/io/Serializable;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    check-cast p1, [I

    .line 107
    .line 108
    if-eqz p1, :cond_4

    .line 109
    .line 110
    array-length v1, p1

    .line 111
    if-eq v1, v5, :cond_3

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_3
    aget v1, p1, v4

    .line 115
    .line 116
    iget-object v2, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 117
    .line 118
    invoke-static {v1, v2}, Lv10;->c(ILjava/nio/ByteOrder;)Lv10;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    aget p1, p1, v3

    .line 123
    .line 124
    iget-object p0, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 125
    .line 126
    invoke-static {p1, p0}, Lv10;->c(ILjava/nio/ByteOrder;)Lv10;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    :goto_1
    aget-object p1, v0, p2

    .line 131
    .line 132
    invoke-virtual {p1, v7, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    aget-object p1, v0, p2

    .line 136
    .line 137
    invoke-virtual {p1, v6, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_4
    :goto_2
    invoke-static {p1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_5
    if-eqz v2, :cond_6

    .line 146
    .line 147
    if-eqz v3, :cond_6

    .line 148
    .line 149
    if-eqz v4, :cond_6

    .line 150
    .line 151
    if-eqz v5, :cond_6

    .line 152
    .line 153
    iget-object p1, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 154
    .line 155
    invoke-virtual {v2, p1}, Lv10;->e(Ljava/nio/ByteOrder;)I

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    iget-object v1, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 160
    .line 161
    invoke-virtual {v4, v1}, Lv10;->e(Ljava/nio/ByteOrder;)I

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    iget-object v2, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 166
    .line 167
    invoke-virtual {v5, v2}, Lv10;->e(Ljava/nio/ByteOrder;)I

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    iget-object v4, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 172
    .line 173
    invoke-virtual {v3, v4}, Lv10;->e(Ljava/nio/ByteOrder;)I

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    if-le v1, p1, :cond_8

    .line 178
    .line 179
    if-le v2, v3, :cond_8

    .line 180
    .line 181
    sub-int/2addr v1, p1

    .line 182
    sub-int/2addr v2, v3

    .line 183
    iget-object p1, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 184
    .line 185
    invoke-static {v1, p1}, Lv10;->c(ILjava/nio/ByteOrder;)Lv10;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    iget-object p0, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 190
    .line 191
    invoke-static {v2, p0}, Lv10;->c(ILjava/nio/ByteOrder;)Lv10;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    aget-object v1, v0, p2

    .line 196
    .line 197
    invoke-virtual {v1, v6, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    aget-object p1, v0, p2

    .line 201
    .line 202
    invoke-virtual {p1, v7, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    return-void

    .line 206
    :cond_6
    aget-object v1, v0, p2

    .line 207
    .line 208
    invoke-virtual {v1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    check-cast v1, Lv10;

    .line 213
    .line 214
    aget-object v2, v0, p2

    .line 215
    .line 216
    invoke-virtual {v2, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v2

    .line 220
    check-cast v2, Lv10;

    .line 221
    .line 222
    if-eqz v1, :cond_7

    .line 223
    .line 224
    if-nez v2, :cond_8

    .line 225
    .line 226
    :cond_7
    aget-object v0, v0, p2

    .line 227
    .line 228
    const-string v1, "JPEGInterchangeFormat"

    .line 229
    .line 230
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    check-cast v0, Lv10;

    .line 235
    .line 236
    if-eqz v0, :cond_8

    .line 237
    .line 238
    iget-object v1, p0, Ly10;->e:Ljava/nio/ByteOrder;

    .line 239
    .line 240
    invoke-virtual {v0, v1}, Lv10;->e(Ljava/nio/ByteOrder;)I

    .line 241
    .line 242
    .line 243
    move-result v0

    .line 244
    invoke-virtual {p0, p1, v0, p2}, Ly10;->e(Lu10;II)V

    .line 245
    .line 246
    .line 247
    :cond_8
    return-void
.end method
