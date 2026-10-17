.class public final Lcom/squareup/picasso/Request$Builder;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/picasso/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private centerCrop:Z

.field private centerCropGravity:I

.field private centerInside:Z

.field private config:Landroid/graphics/Bitmap$Config;

.field private hasRotationPivot:Z

.field private onlyScaleDown:Z

.field private priority:Lcom/squareup/picasso/Picasso$Priority;

.field private purgeable:Z

.field private resourceId:I

.field private rotationDegrees:F

.field private rotationPivotX:F

.field private rotationPivotY:F

.field private stableKey:Ljava/lang/String;

.field private targetHeight:I

.field private targetWidth:I

.field private transformations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/squareup/picasso/Transformation;",
            ">;"
        }
    .end annotation
.end field

.field private uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    invoke-virtual {p0, p1}, Lcom/squareup/picasso/Request$Builder;->setResourceId(I)Lcom/squareup/picasso/Request$Builder;

    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;)V
    .locals 0

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    invoke-virtual {p0, p1}, Lcom/squareup/picasso/Request$Builder;->setUri(Landroid/net/Uri;)Lcom/squareup/picasso/Request$Builder;

    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;ILandroid/graphics/Bitmap$Config;)V
    .locals 0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput-object p1, p0, Lcom/squareup/picasso/Request$Builder;->uri:Landroid/net/Uri;

    .line 88
    iput p2, p0, Lcom/squareup/picasso/Request$Builder;->resourceId:I

    .line 89
    iput-object p3, p0, Lcom/squareup/picasso/Request$Builder;->config:Landroid/graphics/Bitmap$Config;

    return-void
.end method

.method private constructor <init>(Lcom/squareup/picasso/Request;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/squareup/picasso/Request;->uri:Landroid/net/Uri;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/squareup/picasso/Request$Builder;->uri:Landroid/net/Uri;

    .line 7
    .line 8
    iget v0, p1, Lcom/squareup/picasso/Request;->resourceId:I

    .line 9
    .line 10
    iput v0, p0, Lcom/squareup/picasso/Request$Builder;->resourceId:I

    .line 11
    .line 12
    iget-object v0, p1, Lcom/squareup/picasso/Request;->stableKey:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/squareup/picasso/Request$Builder;->stableKey:Ljava/lang/String;

    .line 15
    .line 16
    iget v0, p1, Lcom/squareup/picasso/Request;->targetWidth:I

    .line 17
    .line 18
    iput v0, p0, Lcom/squareup/picasso/Request$Builder;->targetWidth:I

    .line 19
    .line 20
    iget v0, p1, Lcom/squareup/picasso/Request;->targetHeight:I

    .line 21
    .line 22
    iput v0, p0, Lcom/squareup/picasso/Request$Builder;->targetHeight:I

    .line 23
    .line 24
    iget-boolean v0, p1, Lcom/squareup/picasso/Request;->centerCrop:Z

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/squareup/picasso/Request$Builder;->centerCrop:Z

    .line 27
    .line 28
    iget-boolean v0, p1, Lcom/squareup/picasso/Request;->centerInside:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Lcom/squareup/picasso/Request$Builder;->centerInside:Z

    .line 31
    .line 32
    iget v0, p1, Lcom/squareup/picasso/Request;->centerCropGravity:I

    .line 33
    .line 34
    iput v0, p0, Lcom/squareup/picasso/Request$Builder;->centerCropGravity:I

    .line 35
    .line 36
    iget v0, p1, Lcom/squareup/picasso/Request;->rotationDegrees:F

    .line 37
    .line 38
    iput v0, p0, Lcom/squareup/picasso/Request$Builder;->rotationDegrees:F

    .line 39
    .line 40
    iget v0, p1, Lcom/squareup/picasso/Request;->rotationPivotX:F

    .line 41
    .line 42
    iput v0, p0, Lcom/squareup/picasso/Request$Builder;->rotationPivotX:F

    .line 43
    .line 44
    iget v0, p1, Lcom/squareup/picasso/Request;->rotationPivotY:F

    .line 45
    .line 46
    iput v0, p0, Lcom/squareup/picasso/Request$Builder;->rotationPivotY:F

    .line 47
    .line 48
    iget-boolean v0, p1, Lcom/squareup/picasso/Request;->hasRotationPivot:Z

    .line 49
    .line 50
    iput-boolean v0, p0, Lcom/squareup/picasso/Request$Builder;->hasRotationPivot:Z

    .line 51
    .line 52
    iget-boolean v0, p1, Lcom/squareup/picasso/Request;->purgeable:Z

    .line 53
    .line 54
    iput-boolean v0, p0, Lcom/squareup/picasso/Request$Builder;->purgeable:Z

    .line 55
    .line 56
    iget-boolean v0, p1, Lcom/squareup/picasso/Request;->onlyScaleDown:Z

    .line 57
    .line 58
    iput-boolean v0, p0, Lcom/squareup/picasso/Request$Builder;->onlyScaleDown:Z

    .line 59
    .line 60
    iget-object v0, p1, Lcom/squareup/picasso/Request;->transformations:Ljava/util/List;

    .line 61
    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    new-instance v0, Ljava/util/ArrayList;

    .line 65
    .line 66
    iget-object v1, p1, Lcom/squareup/picasso/Request;->transformations:Ljava/util/List;

    .line 67
    .line 68
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 69
    .line 70
    .line 71
    iput-object v0, p0, Lcom/squareup/picasso/Request$Builder;->transformations:Ljava/util/List;

    .line 72
    .line 73
    :cond_0
    iget-object v0, p1, Lcom/squareup/picasso/Request;->config:Landroid/graphics/Bitmap$Config;

    .line 74
    .line 75
    iput-object v0, p0, Lcom/squareup/picasso/Request$Builder;->config:Landroid/graphics/Bitmap$Config;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/squareup/picasso/Request;->priority:Lcom/squareup/picasso/Picasso$Priority;

    .line 78
    .line 79
    iput-object p1, p0, Lcom/squareup/picasso/Request$Builder;->priority:Lcom/squareup/picasso/Picasso$Priority;

    .line 80
    .line 81
    return-void
.end method

.method public synthetic constructor <init>(Lcom/squareup/picasso/Request;Lcom/squareup/picasso/Request$1;)V
    .locals 0

    .line 90
    invoke-direct {p0, p1}, Lcom/squareup/picasso/Request$Builder;-><init>(Lcom/squareup/picasso/Request;)V

    return-void
.end method


# virtual methods
.method public build()Lcom/squareup/picasso/Request;
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-boolean v8, v0, Lcom/squareup/picasso/Request$Builder;->centerInside:Z

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v8, :cond_1

    .line 7
    .line 8
    iget-boolean v2, v0, Lcom/squareup/picasso/Request$Builder;->centerCrop:Z

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string v0, "Center crop and center inside can not be used together."

    .line 14
    .line 15
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-object v1

    .line 19
    :cond_1
    :goto_0
    iget-boolean v7, v0, Lcom/squareup/picasso/Request$Builder;->centerCrop:Z

    .line 20
    .line 21
    if-eqz v7, :cond_3

    .line 22
    .line 23
    iget v2, v0, Lcom/squareup/picasso/Request$Builder;->targetWidth:I

    .line 24
    .line 25
    if-nez v2, :cond_3

    .line 26
    .line 27
    iget v2, v0, Lcom/squareup/picasso/Request$Builder;->targetHeight:I

    .line 28
    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_2
    const-string v0, "Center crop requires calling resize with positive width and height."

    .line 33
    .line 34
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-object v1

    .line 38
    :cond_3
    :goto_1
    if-eqz v8, :cond_5

    .line 39
    .line 40
    iget v2, v0, Lcom/squareup/picasso/Request$Builder;->targetWidth:I

    .line 41
    .line 42
    if-nez v2, :cond_5

    .line 43
    .line 44
    iget v2, v0, Lcom/squareup/picasso/Request$Builder;->targetHeight:I

    .line 45
    .line 46
    if-eqz v2, :cond_4

    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_4
    const-string v0, "Center inside requires calling resize with positive width and height."

    .line 50
    .line 51
    invoke-static {v0}, Lz0;->g(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-object v1

    .line 55
    :cond_5
    :goto_2
    iget-object v1, v0, Lcom/squareup/picasso/Request$Builder;->priority:Lcom/squareup/picasso/Picasso$Priority;

    .line 56
    .line 57
    if-nez v1, :cond_6

    .line 58
    .line 59
    sget-object v1, Lcom/squareup/picasso/Picasso$Priority;->NORMAL:Lcom/squareup/picasso/Picasso$Priority;

    .line 60
    .line 61
    iput-object v1, v0, Lcom/squareup/picasso/Request$Builder;->priority:Lcom/squareup/picasso/Picasso$Priority;

    .line 62
    .line 63
    :cond_6
    move-object/from16 v17, v1

    .line 64
    .line 65
    new-instance v1, Lcom/squareup/picasso/Request;

    .line 66
    .line 67
    move-object v2, v1

    .line 68
    iget-object v1, v0, Lcom/squareup/picasso/Request$Builder;->uri:Landroid/net/Uri;

    .line 69
    .line 70
    move-object v3, v2

    .line 71
    iget v2, v0, Lcom/squareup/picasso/Request$Builder;->resourceId:I

    .line 72
    .line 73
    move-object v4, v3

    .line 74
    iget-object v3, v0, Lcom/squareup/picasso/Request$Builder;->stableKey:Ljava/lang/String;

    .line 75
    .line 76
    move-object v5, v4

    .line 77
    iget-object v4, v0, Lcom/squareup/picasso/Request$Builder;->transformations:Ljava/util/List;

    .line 78
    .line 79
    move-object v6, v5

    .line 80
    iget v5, v0, Lcom/squareup/picasso/Request$Builder;->targetWidth:I

    .line 81
    .line 82
    move-object v9, v6

    .line 83
    iget v6, v0, Lcom/squareup/picasso/Request$Builder;->targetHeight:I

    .line 84
    .line 85
    move-object v10, v9

    .line 86
    iget v9, v0, Lcom/squareup/picasso/Request$Builder;->centerCropGravity:I

    .line 87
    .line 88
    move-object v11, v10

    .line 89
    iget-boolean v10, v0, Lcom/squareup/picasso/Request$Builder;->onlyScaleDown:Z

    .line 90
    .line 91
    move-object v12, v11

    .line 92
    iget v11, v0, Lcom/squareup/picasso/Request$Builder;->rotationDegrees:F

    .line 93
    .line 94
    move-object v13, v12

    .line 95
    iget v12, v0, Lcom/squareup/picasso/Request$Builder;->rotationPivotX:F

    .line 96
    .line 97
    move-object v14, v13

    .line 98
    iget v13, v0, Lcom/squareup/picasso/Request$Builder;->rotationPivotY:F

    .line 99
    .line 100
    move-object v15, v14

    .line 101
    iget-boolean v14, v0, Lcom/squareup/picasso/Request$Builder;->hasRotationPivot:Z

    .line 102
    .line 103
    move-object/from16 v16, v15

    .line 104
    .line 105
    iget-boolean v15, v0, Lcom/squareup/picasso/Request$Builder;->purgeable:Z

    .line 106
    .line 107
    iget-object v0, v0, Lcom/squareup/picasso/Request$Builder;->config:Landroid/graphics/Bitmap$Config;

    .line 108
    .line 109
    const/16 v18, 0x0

    .line 110
    .line 111
    move-object/from16 v19, v16

    .line 112
    .line 113
    move-object/from16 v16, v0

    .line 114
    .line 115
    move-object/from16 v0, v19

    .line 116
    .line 117
    invoke-direct/range {v0 .. v18}, Lcom/squareup/picasso/Request;-><init>(Landroid/net/Uri;ILjava/lang/String;Ljava/util/List;IIZZIZFFFZZLandroid/graphics/Bitmap$Config;Lcom/squareup/picasso/Picasso$Priority;Lcom/squareup/picasso/Request$1;)V

    .line 118
    .line 119
    .line 120
    return-object v0
.end method

.method public centerCrop()Lcom/squareup/picasso/Request$Builder;
    .locals 1

    const/16 v0, 0x11

    .line 18
    invoke-virtual {p0, v0}, Lcom/squareup/picasso/Request$Builder;->centerCrop(I)Lcom/squareup/picasso/Request$Builder;

    move-result-object p0

    return-object p0
.end method

.method public centerCrop(I)Lcom/squareup/picasso/Request$Builder;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/squareup/picasso/Request$Builder;->centerInside:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/squareup/picasso/Request$Builder;->centerCrop:Z

    .line 7
    .line 8
    iput p1, p0, Lcom/squareup/picasso/Request$Builder;->centerCropGravity:I

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    const-string p0, "Center crop can not be used after calling centerInside"

    .line 12
    .line 13
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public centerInside()Lcom/squareup/picasso/Request$Builder;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/squareup/picasso/Request$Builder;->centerCrop:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/squareup/picasso/Request$Builder;->centerInside:Z

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const-string p0, "Center inside can not be used after calling centerCrop"

    .line 10
    .line 11
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public clearCenterCrop()Lcom/squareup/picasso/Request$Builder;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/squareup/picasso/Request$Builder;->centerCrop:Z

    .line 3
    .line 4
    const/16 v0, 0x11

    .line 5
    .line 6
    iput v0, p0, Lcom/squareup/picasso/Request$Builder;->centerCropGravity:I

    .line 7
    .line 8
    return-object p0
.end method

.method public clearCenterInside()Lcom/squareup/picasso/Request$Builder;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/squareup/picasso/Request$Builder;->centerInside:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public clearOnlyScaleDown()Lcom/squareup/picasso/Request$Builder;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/squareup/picasso/Request$Builder;->onlyScaleDown:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public clearResize()Lcom/squareup/picasso/Request$Builder;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/squareup/picasso/Request$Builder;->targetWidth:I

    .line 3
    .line 4
    iput v0, p0, Lcom/squareup/picasso/Request$Builder;->targetHeight:I

    .line 5
    .line 6
    iput-boolean v0, p0, Lcom/squareup/picasso/Request$Builder;->centerCrop:Z

    .line 7
    .line 8
    iput-boolean v0, p0, Lcom/squareup/picasso/Request$Builder;->centerInside:Z

    .line 9
    .line 10
    return-object p0
.end method

.method public clearRotation()Lcom/squareup/picasso/Request$Builder;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/squareup/picasso/Request$Builder;->rotationDegrees:F

    .line 3
    .line 4
    iput v0, p0, Lcom/squareup/picasso/Request$Builder;->rotationPivotX:F

    .line 5
    .line 6
    iput v0, p0, Lcom/squareup/picasso/Request$Builder;->rotationPivotY:F

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/squareup/picasso/Request$Builder;->hasRotationPivot:Z

    .line 10
    .line 11
    return-object p0
.end method

.method public config(Landroid/graphics/Bitmap$Config;)Lcom/squareup/picasso/Request$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/squareup/picasso/Request$Builder;->config:Landroid/graphics/Bitmap$Config;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "config == null"

    .line 7
    .line 8
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public hasImage()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/squareup/picasso/Request$Builder;->uri:Landroid/net/Uri;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget p0, p0, Lcom/squareup/picasso/Request$Builder;->resourceId:I

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public hasPriority()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/squareup/picasso/Request$Builder;->priority:Lcom/squareup/picasso/Picasso$Priority;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public hasSize()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/squareup/picasso/Request$Builder;->targetWidth:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget p0, p0, Lcom/squareup/picasso/Request$Builder;->targetHeight:I

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public onlyScaleDown()Lcom/squareup/picasso/Request$Builder;
    .locals 1

    .line 1
    iget v0, p0, Lcom/squareup/picasso/Request$Builder;->targetHeight:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/squareup/picasso/Request$Builder;->targetWidth:I

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "onlyScaleDown can not be applied without resize"

    .line 11
    .line 12
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Lcom/squareup/picasso/Request$Builder;->onlyScaleDown:Z

    .line 19
    .line 20
    return-object p0
.end method

.method public priority(Lcom/squareup/picasso/Picasso$Priority;)Lcom/squareup/picasso/Request$Builder;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    iget-object v1, p0, Lcom/squareup/picasso/Request$Builder;->priority:Lcom/squareup/picasso/Picasso$Priority;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    iput-object p1, p0, Lcom/squareup/picasso/Request$Builder;->priority:Lcom/squareup/picasso/Picasso$Priority;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    const-string p0, "Priority already set."

    .line 12
    .line 13
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_1
    const-string p0, "Priority invalid."

    .line 18
    .line 19
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public purgeable()Lcom/squareup/picasso/Request$Builder;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/squareup/picasso/Request$Builder;->purgeable:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public resize(II)Lcom/squareup/picasso/Request$Builder;
    .locals 0

    .line 1
    if-ltz p1, :cond_3

    .line 2
    .line 3
    if-ltz p2, :cond_2

    .line 4
    .line 5
    if-nez p2, :cond_1

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "At least one dimension has to be positive number."

    .line 11
    .line 12
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    iput p1, p0, Lcom/squareup/picasso/Request$Builder;->targetWidth:I

    .line 18
    .line 19
    iput p2, p0, Lcom/squareup/picasso/Request$Builder;->targetHeight:I

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_2
    const-string p0, "Height must be positive number or 0."

    .line 23
    .line 24
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return-object p0

    .line 29
    :cond_3
    const-string p0, "Width must be positive number or 0."

    .line 30
    .line 31
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

.method public rotate(F)Lcom/squareup/picasso/Request$Builder;
    .locals 0

    .line 11
    iput p1, p0, Lcom/squareup/picasso/Request$Builder;->rotationDegrees:F

    return-object p0
.end method

.method public rotate(FFF)Lcom/squareup/picasso/Request$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/squareup/picasso/Request$Builder;->rotationDegrees:F

    .line 2
    .line 3
    iput p2, p0, Lcom/squareup/picasso/Request$Builder;->rotationPivotX:F

    .line 4
    .line 5
    iput p3, p0, Lcom/squareup/picasso/Request$Builder;->rotationPivotY:F

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lcom/squareup/picasso/Request$Builder;->hasRotationPivot:Z

    .line 9
    .line 10
    return-object p0
.end method

.method public setResourceId(I)Lcom/squareup/picasso/Request$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput p1, p0, Lcom/squareup/picasso/Request$Builder;->resourceId:I

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Lcom/squareup/picasso/Request$Builder;->uri:Landroid/net/Uri;

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const-string p0, "Image resource ID may not be 0."

    .line 10
    .line 11
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public setUri(Landroid/net/Uri;)Lcom/squareup/picasso/Request$Builder;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/squareup/picasso/Request$Builder;->uri:Landroid/net/Uri;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput p1, p0, Lcom/squareup/picasso/Request$Builder;->resourceId:I

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const-string p0, "Image URI may not be null."

    .line 10
    .line 11
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public stableKey(Ljava/lang/String;)Lcom/squareup/picasso/Request$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/squareup/picasso/Request$Builder;->stableKey:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public transform(Lcom/squareup/picasso/Transformation;)Lcom/squareup/picasso/Request$Builder;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    invoke-interface {p1}, Lcom/squareup/picasso/Transformation;->key()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/squareup/picasso/Request$Builder;->transformations:Ljava/util/List;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/squareup/picasso/Request$Builder;->transformations:Ljava/util/List;

    .line 21
    .line 22
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_1
    const-string p0, "Transformation key must not be null."

    .line 27
    .line 28
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-object v0

    .line 32
    :cond_2
    const-string p0, "Transformation must not be null."

    .line 33
    .line 34
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public transform(Ljava/util/List;)Lcom/squareup/picasso/Request$Builder;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/squareup/picasso/Transformation;",
            ">;)",
            "Lcom/squareup/picasso/Request$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 38
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 39
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/squareup/picasso/Transformation;

    invoke-virtual {p0, v2}, Lcom/squareup/picasso/Request$Builder;->transform(Lcom/squareup/picasso/Transformation;)Lcom/squareup/picasso/Request$Builder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0

    .line 40
    :cond_1
    const-string p0, "Transformation list must not be null."

    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method
