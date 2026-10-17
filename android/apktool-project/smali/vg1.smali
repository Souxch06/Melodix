.class public final Lvg1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final p:Landroid/graphics/Matrix;


# instance fields
.field public final a:Landroid/graphics/Path;

.field public final b:Landroid/graphics/Path;

.field public final c:Landroid/graphics/Matrix;

.field public d:Landroid/graphics/Paint;

.field public e:Landroid/graphics/Paint;

.field public f:Landroid/graphics/PathMeasure;

.field public final g:Lsg1;

.field public h:F

.field public i:F

.field public j:F

.field public k:F

.field public l:I

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/Boolean;

.field public final o:Lda;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lvg1;->p:Landroid/graphics/Matrix;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lvg1;->c:Landroid/graphics/Matrix;

    const/4 v0, 0x0

    .line 101
    iput v0, p0, Lvg1;->h:F

    .line 102
    iput v0, p0, Lvg1;->i:F

    .line 103
    iput v0, p0, Lvg1;->j:F

    .line 104
    iput v0, p0, Lvg1;->k:F

    const/16 v0, 0xff

    .line 105
    iput v0, p0, Lvg1;->l:I

    const/4 v0, 0x0

    .line 106
    iput-object v0, p0, Lvg1;->m:Ljava/lang/String;

    .line 107
    iput-object v0, p0, Lvg1;->n:Ljava/lang/Boolean;

    .line 108
    new-instance v0, Lda;

    .line 109
    invoke-direct {v0}, Lu71;-><init>()V

    .line 110
    iput-object v0, p0, Lvg1;->o:Lda;

    .line 111
    new-instance v0, Lsg1;

    invoke-direct {v0}, Lsg1;-><init>()V

    iput-object v0, p0, Lvg1;->g:Lsg1;

    .line 112
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lvg1;->a:Landroid/graphics/Path;

    .line 113
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lvg1;->b:Landroid/graphics/Path;

    return-void
.end method

.method public constructor <init>(Lvg1;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lvg1;->c:Landroid/graphics/Matrix;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lvg1;->h:F

    .line 13
    .line 14
    iput v0, p0, Lvg1;->i:F

    .line 15
    .line 16
    iput v0, p0, Lvg1;->j:F

    .line 17
    .line 18
    iput v0, p0, Lvg1;->k:F

    .line 19
    .line 20
    const/16 v0, 0xff

    .line 21
    .line 22
    iput v0, p0, Lvg1;->l:I

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Lvg1;->m:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v0, p0, Lvg1;->n:Ljava/lang/Boolean;

    .line 28
    .line 29
    new-instance v0, Lda;

    .line 30
    .line 31
    invoke-direct {v0}, Lu71;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lvg1;->o:Lda;

    .line 35
    .line 36
    new-instance v1, Lsg1;

    .line 37
    .line 38
    iget-object v2, p1, Lvg1;->g:Lsg1;

    .line 39
    .line 40
    invoke-direct {v1, v2, v0}, Lsg1;-><init>(Lsg1;Lda;)V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Lvg1;->g:Lsg1;

    .line 44
    .line 45
    new-instance v1, Landroid/graphics/Path;

    .line 46
    .line 47
    iget-object v2, p1, Lvg1;->a:Landroid/graphics/Path;

    .line 48
    .line 49
    invoke-direct {v1, v2}, Landroid/graphics/Path;-><init>(Landroid/graphics/Path;)V

    .line 50
    .line 51
    .line 52
    iput-object v1, p0, Lvg1;->a:Landroid/graphics/Path;

    .line 53
    .line 54
    new-instance v1, Landroid/graphics/Path;

    .line 55
    .line 56
    iget-object v2, p1, Lvg1;->b:Landroid/graphics/Path;

    .line 57
    .line 58
    invoke-direct {v1, v2}, Landroid/graphics/Path;-><init>(Landroid/graphics/Path;)V

    .line 59
    .line 60
    .line 61
    iput-object v1, p0, Lvg1;->b:Landroid/graphics/Path;

    .line 62
    .line 63
    iget v1, p1, Lvg1;->h:F

    .line 64
    .line 65
    iput v1, p0, Lvg1;->h:F

    .line 66
    .line 67
    iget v1, p1, Lvg1;->i:F

    .line 68
    .line 69
    iput v1, p0, Lvg1;->i:F

    .line 70
    .line 71
    iget v1, p1, Lvg1;->j:F

    .line 72
    .line 73
    iput v1, p0, Lvg1;->j:F

    .line 74
    .line 75
    iget v1, p1, Lvg1;->k:F

    .line 76
    .line 77
    iput v1, p0, Lvg1;->k:F

    .line 78
    .line 79
    iget v1, p1, Lvg1;->l:I

    .line 80
    .line 81
    iput v1, p0, Lvg1;->l:I

    .line 82
    .line 83
    iget-object v1, p1, Lvg1;->m:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v1, p0, Lvg1;->m:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v1, p1, Lvg1;->m:Ljava/lang/String;

    .line 88
    .line 89
    if-eqz v1, :cond_0

    .line 90
    .line 91
    invoke-virtual {v0, v1, p0}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    :cond_0
    iget-object p1, p1, Lvg1;->n:Ljava/lang/Boolean;

    .line 95
    .line 96
    iput-object p1, p0, Lvg1;->n:Ljava/lang/Boolean;

    .line 97
    .line 98
    return-void
.end method


# virtual methods
.method public final a(Lsg1;Landroid/graphics/Matrix;Landroid/graphics/Canvas;II)V
    .locals 40

    move-object/from16 v0, p1

    .line 1
    iget-object v1, v0, Lsg1;->a:Landroid/graphics/Matrix;

    iget-object v6, v0, Lsg1;->b:Ljava/util/ArrayList;

    move-object/from16 v2, p2

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 2
    iget-object v2, v0, Lsg1;->a:Landroid/graphics/Matrix;

    iget-object v0, v0, Lsg1;->j:Landroid/graphics/Matrix;

    invoke-virtual {v2, v0}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 3
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Canvas;->save()I

    const/4 v7, 0x0

    move v8, v7

    .line 4
    :goto_0
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v8, v0, :cond_38

    .line 5
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltg1;

    .line 6
    instance-of v1, v0, Lsg1;

    if-eqz v1, :cond_1

    .line 7
    move-object v1, v0

    check-cast v1, Lsg1;

    move-object/from16 v0, p0

    move-object/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    .line 8
    invoke-virtual/range {v0 .. v5}, Lvg1;->a(Lsg1;Landroid/graphics/Matrix;Landroid/graphics/Canvas;II)V

    move-object v1, v0

    :cond_0
    move-object/from16 v31, v2

    move-object/from16 v33, v6

    move/from16 v16, v8

    goto/16 :goto_29

    :cond_1
    move-object/from16 v1, p0

    move-object/from16 v3, p3

    .line 9
    instance-of v4, v0, Lug1;

    if-eqz v4, :cond_0

    .line 10
    check-cast v0, Lug1;

    move/from16 v4, p4

    int-to-float v5, v4

    .line 11
    iget v9, v1, Lvg1;->j:F

    div-float/2addr v5, v9

    move/from16 v9, p5

    int-to-float v10, v9

    .line 12
    iget v11, v1, Lvg1;->k:F

    div-float/2addr v10, v11

    .line 13
    invoke-static {v5, v10}, Ljava/lang/Math;->min(FF)F

    move-result v11

    .line 14
    iget-object v12, v1, Lvg1;->c:Landroid/graphics/Matrix;

    invoke-virtual {v12, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 15
    invoke-virtual {v12, v5, v10}, Landroid/graphics/Matrix;->postScale(FF)Z

    const/4 v5, 0x4

    .line 16
    new-array v10, v5, [F

    fill-array-data v10, :array_0

    .line 17
    invoke-virtual {v2, v10}, Landroid/graphics/Matrix;->mapVectors([F)V

    .line 18
    aget v13, v10, v7

    float-to-double v13, v13

    const/4 v15, 0x1

    move/from16 p1, v5

    aget v5, v10, v15

    move/from16 p2, v7

    move/from16 v16, v8

    float-to-double v7, v5

    invoke-static {v13, v14, v7, v8}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v7

    double-to-float v5, v7

    const/4 v7, 0x2

    .line 19
    aget v8, v10, v7

    float-to-double v13, v8

    const/4 v8, 0x3

    move/from16 v17, v7

    aget v7, v10, v8

    move/from16 v18, v8

    float-to-double v8, v7

    invoke-static {v13, v14, v8, v9}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v7

    double-to-float v7, v7

    .line 20
    aget v8, v10, p2

    aget v9, v10, v15

    aget v13, v10, v17

    aget v10, v10, v18

    mul-float/2addr v8, v10

    mul-float/2addr v9, v13

    sub-float/2addr v8, v9

    .line 21
    invoke-static {v5, v7}, Ljava/lang/Math;->max(FF)F

    move-result v5

    const/4 v7, 0x0

    cmpl-float v9, v5, v7

    if-lez v9, :cond_2

    .line 22
    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    div-float/2addr v8, v5

    goto :goto_1

    :cond_2
    move v8, v7

    :goto_1
    cmpl-float v5, v8, v7

    if-nez v5, :cond_3

    move/from16 v7, p2

    move-object/from16 v31, v2

    move-object/from16 v33, v6

    goto/16 :goto_29

    .line 23
    :cond_3
    iget-object v5, v1, Lvg1;->a:Landroid/graphics/Path;

    invoke-virtual {v5}, Landroid/graphics/Path;->reset()V

    .line 24
    iget-object v9, v0, Lug1;->a:[Lus0;

    if-eqz v9, :cond_26

    const/4 v10, 0x6

    .line 25
    new-array v13, v10, [F

    .line 26
    array-length v14, v9

    move/from16 v29, v15

    const/16 v19, 0x6d

    move/from16 v15, p2

    :goto_2
    if-ge v15, v14, :cond_25

    aget-object v7, v9, v15

    .line 27
    iget-char v10, v7, Lus0;->a:C

    move-object/from16 v31, v2

    .line 28
    iget-object v2, v7, Lus0;->b:[F

    .line 29
    aget v20, v13, p2

    .line 30
    aget v21, v13, v29

    .line 31
    aget v22, v13, v17

    .line 32
    aget v23, v13, v18

    .line 33
    aget v4, v13, p1

    const/16 v32, 0x5

    move-object/from16 v33, v6

    .line 34
    aget v6, v13, v32

    sparse-switch v10, :sswitch_data_0

    :goto_3
    move/from16 v34, v17

    goto :goto_4

    .line 35
    :sswitch_0
    invoke-virtual {v5}, Landroid/graphics/Path;->close()V

    .line 36
    invoke-virtual {v5, v4, v6}, Landroid/graphics/Path;->moveTo(FF)V

    move/from16 v20, v4

    move/from16 v22, v20

    move/from16 v21, v6

    move/from16 v23, v21

    goto :goto_3

    :sswitch_1
    move/from16 v34, p1

    goto :goto_4

    :sswitch_2
    move/from16 v34, v29

    goto :goto_4

    :sswitch_3
    const/16 v34, 0x6

    goto :goto_4

    :sswitch_4
    const/16 v24, 0x7

    move/from16 v34, v24

    :goto_4
    move/from16 v35, v4

    move/from16 v36, v6

    move/from16 v37, v8

    move/from16 v4, v19

    move/from16 v26, v20

    move/from16 v27, v21

    move/from16 v6, p2

    .line 37
    :goto_5
    array-length v8, v2

    if-ge v6, v8, :cond_24

    const/16 v8, 0x41

    if-eq v10, v8, :cond_21

    const/16 v8, 0x43

    if-eq v10, v8, :cond_20

    const/16 v8, 0x48

    if-eq v10, v8, :cond_1f

    const/16 v8, 0x51

    if-eq v10, v8, :cond_1e

    const/16 v8, 0x56

    if-eq v10, v8, :cond_1d

    const/16 v8, 0x61

    if-eq v10, v8, :cond_1a

    const/16 v8, 0x63

    if-eq v10, v8, :cond_19

    const/16 v8, 0x68

    if-eq v10, v8, :cond_18

    const/16 v8, 0x71

    if-eq v10, v8, :cond_17

    const/16 v8, 0x76

    if-eq v10, v8, :cond_16

    const/16 v8, 0x4c

    if-eq v10, v8, :cond_15

    const/16 v8, 0x4d

    if-eq v10, v8, :cond_13

    const/16 v8, 0x53

    const/high16 v28, 0x40000000    # 2.0f

    if-eq v10, v8, :cond_10

    const/16 v8, 0x54

    if-eq v10, v8, :cond_d

    const/16 v8, 0x6c

    if-eq v10, v8, :cond_c

    const/16 v8, 0x6d

    if-eq v10, v8, :cond_a

    const/16 v8, 0x73

    if-eq v10, v8, :cond_7

    const/16 v8, 0x74

    if-eq v10, v8, :cond_4

    move-object/from16 v38, v2

    move/from16 v39, v6

    goto/16 :goto_1d

    :cond_4
    move-object/from16 v38, v2

    const/16 v2, 0x71

    if-eq v4, v2, :cond_6

    if-eq v4, v8, :cond_6

    const/16 v2, 0x51

    if-eq v4, v2, :cond_6

    const/16 v2, 0x54

    if-ne v4, v2, :cond_5

    goto :goto_6

    :cond_5
    const/4 v2, 0x0

    const/4 v4, 0x0

    goto :goto_7

    :cond_6
    :goto_6
    sub-float v2, v26, v22

    sub-float v4, v27, v23

    .line 38
    :goto_7
    aget v8, v38, v6

    add-int/lit8 v19, v6, 0x1

    move/from16 v39, v6

    aget v6, v38, v19

    invoke-virtual {v5, v2, v4, v8, v6}, Landroid/graphics/Path;->rQuadTo(FFFF)V

    add-float v2, v26, v2

    add-float v4, v27, v4

    .line 39
    aget v6, v38, v39

    add-float v26, v26, v6

    .line 40
    aget v6, v38, v19

    :goto_8
    add-float v27, v27, v6

    move/from16 v22, v2

    move/from16 v23, v4

    goto/16 :goto_1d

    :cond_7
    move-object/from16 v38, v2

    move/from16 v39, v6

    const/16 v2, 0x63

    if-eq v4, v2, :cond_9

    const/16 v8, 0x73

    if-eq v4, v8, :cond_9

    const/16 v2, 0x43

    if-eq v4, v2, :cond_9

    const/16 v2, 0x53

    if-ne v4, v2, :cond_8

    goto :goto_9

    :cond_8
    const/16 v20, 0x0

    const/16 v21, 0x0

    goto :goto_a

    :cond_9
    :goto_9
    sub-float v2, v26, v22

    sub-float v4, v27, v23

    move/from16 v20, v2

    move/from16 v21, v4

    .line 41
    :goto_a
    aget v22, v38, v39

    add-int/lit8 v6, v39, 0x1

    aget v23, v38, v6

    add-int/lit8 v2, v39, 0x2

    aget v24, v38, v2

    add-int/lit8 v4, v39, 0x3

    aget v25, v38, v4

    move-object/from16 v19, v5

    invoke-virtual/range {v19 .. v25}, Landroid/graphics/Path;->rCubicTo(FFFFFF)V

    .line 42
    aget v8, v38, v39

    add-float v8, v26, v8

    .line 43
    aget v6, v38, v6

    add-float v6, v27, v6

    .line 44
    aget v2, v38, v2

    add-float v26, v26, v2

    .line 45
    aget v2, v38, v4

    add-float v27, v27, v2

    :goto_b
    move/from16 v23, v6

    move/from16 v22, v8

    goto/16 :goto_1d

    :cond_a
    move-object/from16 v38, v2

    move/from16 v39, v6

    .line 46
    aget v2, v38, v39

    add-float v26, v26, v2

    add-int/lit8 v6, v39, 0x1

    .line 47
    aget v4, v38, v6

    add-float v27, v27, v4

    if-lez v39, :cond_b

    .line 48
    invoke-virtual {v5, v2, v4}, Landroid/graphics/Path;->rLineTo(FF)V

    goto/16 :goto_1d

    .line 49
    :cond_b
    invoke-virtual {v5, v2, v4}, Landroid/graphics/Path;->rMoveTo(FF)V

    move/from16 v35, v26

    :goto_c
    move/from16 v36, v27

    goto/16 :goto_1d

    :cond_c
    move-object/from16 v38, v2

    move/from16 v39, v6

    .line 50
    aget v2, v38, v39

    add-int/lit8 v6, v39, 0x1

    aget v4, v38, v6

    invoke-virtual {v5, v2, v4}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 51
    aget v2, v38, v39

    add-float v26, v26, v2

    .line 52
    aget v2, v38, v6

    :goto_d
    add-float v27, v27, v2

    goto/16 :goto_1d

    :cond_d
    move-object/from16 v38, v2

    move/from16 v39, v6

    const/16 v2, 0x71

    if-eq v4, v2, :cond_f

    const/16 v8, 0x74

    if-eq v4, v8, :cond_f

    const/16 v2, 0x51

    if-eq v4, v2, :cond_f

    const/16 v2, 0x54

    if-ne v4, v2, :cond_e

    goto :goto_f

    :cond_e
    :goto_e
    move/from16 v2, v26

    move/from16 v4, v27

    goto :goto_10

    :cond_f
    :goto_f
    mul-float v26, v26, v28

    sub-float v26, v26, v22

    mul-float v27, v27, v28

    sub-float v27, v27, v23

    goto :goto_e

    .line 53
    :goto_10
    aget v6, v38, v39

    add-int/lit8 v8, v39, 0x1

    move/from16 v19, v8

    aget v8, v38, v19

    invoke-virtual {v5, v2, v4, v6, v8}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 54
    aget v6, v38, v39

    .line 55
    aget v8, v38, v19

    move/from16 v22, v2

    move/from16 v23, v4

    move/from16 v26, v6

    move/from16 v27, v8

    goto/16 :goto_1d

    :cond_10
    move-object/from16 v38, v2

    move/from16 v39, v6

    const/16 v2, 0x63

    if-eq v4, v2, :cond_12

    const/16 v8, 0x73

    if-eq v4, v8, :cond_12

    const/16 v2, 0x43

    if-eq v4, v2, :cond_12

    const/16 v2, 0x53

    if-ne v4, v2, :cond_11

    goto :goto_12

    :cond_11
    :goto_11
    move/from16 v20, v26

    move/from16 v21, v27

    goto :goto_13

    :cond_12
    :goto_12
    mul-float v26, v26, v28

    sub-float v26, v26, v22

    mul-float v27, v27, v28

    sub-float v27, v27, v23

    goto :goto_11

    .line 56
    :goto_13
    aget v22, v38, v39

    add-int/lit8 v6, v39, 0x1

    aget v23, v38, v6

    add-int/lit8 v2, v39, 0x2

    aget v24, v38, v2

    add-int/lit8 v4, v39, 0x3

    aget v25, v38, v4

    move-object/from16 v19, v5

    invoke-virtual/range {v19 .. v25}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 57
    aget v8, v38, v39

    .line 58
    aget v6, v38, v6

    .line 59
    aget v2, v38, v2

    .line 60
    aget v4, v38, v4

    move/from16 v26, v2

    move/from16 v27, v4

    goto/16 :goto_b

    :cond_13
    move-object/from16 v38, v2

    move/from16 v39, v6

    .line 61
    aget v2, v38, v39

    add-int/lit8 v6, v39, 0x1

    .line 62
    aget v4, v38, v6

    if-lez v39, :cond_14

    .line 63
    invoke-virtual {v5, v2, v4}, Landroid/graphics/Path;->lineTo(FF)V

    :goto_14
    move/from16 v26, v2

    move/from16 v27, v4

    goto/16 :goto_1d

    .line 64
    :cond_14
    invoke-virtual {v5, v2, v4}, Landroid/graphics/Path;->moveTo(FF)V

    move/from16 v26, v2

    move/from16 v35, v26

    move/from16 v27, v4

    goto/16 :goto_c

    :cond_15
    move-object/from16 v38, v2

    move/from16 v39, v6

    .line 65
    aget v2, v38, v39

    add-int/lit8 v6, v39, 0x1

    aget v4, v38, v6

    invoke-virtual {v5, v2, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 66
    aget v2, v38, v39

    .line 67
    aget v4, v38, v6

    goto :goto_14

    :cond_16
    move-object/from16 v38, v2

    move/from16 v39, v6

    .line 68
    aget v2, v38, v39

    const/4 v4, 0x0

    invoke-virtual {v5, v4, v2}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 69
    aget v2, v38, v39

    goto/16 :goto_d

    :cond_17
    move-object/from16 v38, v2

    move/from16 v39, v6

    .line 70
    aget v2, v38, v39

    add-int/lit8 v6, v39, 0x1

    aget v4, v38, v6

    add-int/lit8 v8, v39, 0x2

    move/from16 v19, v6

    aget v6, v38, v8

    add-int/lit8 v20, v39, 0x3

    move/from16 v21, v8

    aget v8, v38, v20

    invoke-virtual {v5, v2, v4, v6, v8}, Landroid/graphics/Path;->rQuadTo(FFFF)V

    .line 71
    aget v2, v38, v39

    add-float v2, v26, v2

    .line 72
    aget v4, v38, v19

    add-float v4, v27, v4

    .line 73
    aget v6, v38, v21

    add-float v26, v26, v6

    .line 74
    aget v6, v38, v20

    goto/16 :goto_8

    :cond_18
    move-object/from16 v38, v2

    move/from16 v39, v6

    .line 75
    aget v2, v38, v39

    const/4 v4, 0x0

    invoke-virtual {v5, v2, v4}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 76
    aget v2, v38, v39

    add-float v26, v26, v2

    goto/16 :goto_1d

    :cond_19
    move-object/from16 v38, v2

    move/from16 v39, v6

    .line 77
    aget v20, v38, v39

    add-int/lit8 v6, v39, 0x1

    aget v21, v38, v6

    add-int/lit8 v6, v39, 0x2

    aget v22, v38, v6

    add-int/lit8 v2, v39, 0x3

    aget v23, v38, v2

    add-int/lit8 v4, v39, 0x4

    aget v24, v38, v4

    add-int/lit8 v8, v39, 0x5

    aget v25, v38, v8

    move-object/from16 v19, v5

    invoke-virtual/range {v19 .. v25}, Landroid/graphics/Path;->rCubicTo(FFFFFF)V

    .line 78
    aget v5, v38, v6

    add-float v5, v26, v5

    .line 79
    aget v2, v38, v2

    add-float v2, v27, v2

    .line 80
    aget v4, v38, v4

    add-float v26, v26, v4

    .line 81
    aget v4, v38, v8

    add-float v27, v27, v4

    move/from16 v23, v2

    move/from16 v22, v5

    :goto_15
    move-object/from16 v5, v19

    goto/16 :goto_1d

    :cond_1a
    move-object/from16 v38, v2

    move-object/from16 v19, v5

    move/from16 v39, v6

    add-int/lit8 v6, v39, 0x5

    .line 82
    aget v2, v38, v6

    add-float v22, v2, v26

    add-int/lit8 v2, v39, 0x6

    aget v4, v38, v2

    add-float v23, v4, v27

    aget v24, v38, v39

    add-int/lit8 v4, v39, 0x1

    aget v25, v38, v4

    add-int/lit8 v4, v39, 0x2

    aget v4, v38, v4

    add-int/lit8 v5, v39, 0x3

    aget v5, v38, v5

    const/16 v30, 0x0

    cmpl-float v5, v5, v30

    move/from16 v21, v27

    if-eqz v5, :cond_1b

    move/from16 v27, v29

    goto :goto_16

    :cond_1b
    move/from16 v27, p2

    :goto_16
    add-int/lit8 v5, v39, 0x4

    aget v5, v38, v5

    cmpl-float v5, v5, v30

    if-eqz v5, :cond_1c

    move/from16 v28, v29

    :goto_17
    move/from16 v20, v26

    move/from16 v26, v4

    goto :goto_18

    :cond_1c
    move/from16 v28, p2

    goto :goto_17

    :goto_18
    invoke-static/range {v19 .. v28}, Lus0;->a(Landroid/graphics/Path;FFFFFFFZZ)V

    move-object/from16 v8, v19

    move/from16 v4, v20

    move/from16 v5, v21

    .line 83
    aget v6, v38, v6

    add-float v26, v4, v6

    .line 84
    aget v2, v38, v2

    add-float v27, v5, v2

    move-object v5, v8

    move/from16 v22, v26

    move/from16 v23, v27

    goto/16 :goto_1d

    :cond_1d
    move-object/from16 v38, v2

    move-object v8, v5

    move/from16 v39, v6

    move/from16 v4, v26

    .line 85
    aget v2, v38, v39

    invoke-virtual {v8, v4, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 86
    aget v2, v38, v39

    move/from16 v27, v2

    goto/16 :goto_1d

    :cond_1e
    move-object/from16 v38, v2

    move-object v8, v5

    move/from16 v39, v6

    .line 87
    aget v2, v38, v39

    add-int/lit8 v6, v39, 0x1

    aget v4, v38, v6

    add-int/lit8 v5, v39, 0x2

    move/from16 v19, v5

    aget v5, v38, v19

    add-int/lit8 v20, v39, 0x3

    move/from16 v21, v6

    aget v6, v38, v20

    invoke-virtual {v8, v2, v4, v5, v6}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 88
    aget v2, v38, v39

    .line 89
    aget v4, v38, v21

    .line 90
    aget v5, v38, v19

    .line 91
    aget v6, v38, v20

    move/from16 v22, v2

    move/from16 v23, v4

    move/from16 v26, v5

    move/from16 v27, v6

    :goto_19
    move-object v5, v8

    goto/16 :goto_1d

    :cond_1f
    move-object/from16 v38, v2

    move-object v8, v5

    move/from16 v39, v6

    move/from16 v5, v27

    .line 92
    aget v2, v38, v39

    invoke-virtual {v8, v2, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 93
    aget v2, v38, v39

    move/from16 v26, v2

    goto :goto_19

    :cond_20
    move-object/from16 v38, v2

    move-object v8, v5

    move/from16 v39, v6

    .line 94
    aget v20, v38, v39

    add-int/lit8 v6, v39, 0x1

    aget v21, v38, v6

    add-int/lit8 v6, v39, 0x2

    aget v22, v38, v6

    add-int/lit8 v2, v39, 0x3

    aget v23, v38, v2

    add-int/lit8 v4, v39, 0x4

    aget v24, v38, v4

    add-int/lit8 v5, v39, 0x5

    aget v25, v38, v5

    move-object/from16 v19, v8

    invoke-virtual/range {v19 .. v25}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 95
    aget v4, v38, v4

    .line 96
    aget v5, v38, v5

    .line 97
    aget v6, v38, v6

    .line 98
    aget v2, v38, v2

    move/from16 v23, v2

    move/from16 v26, v4

    move/from16 v27, v5

    move/from16 v22, v6

    goto/16 :goto_15

    :cond_21
    move-object/from16 v38, v2

    move-object/from16 v19, v5

    move/from16 v39, v6

    move/from16 v4, v26

    move/from16 v5, v27

    add-int/lit8 v6, v39, 0x5

    .line 99
    aget v22, v38, v6

    add-int/lit8 v2, v39, 0x6

    aget v23, v38, v2

    aget v24, v38, v39

    add-int/lit8 v8, v39, 0x1

    aget v25, v38, v8

    add-int/lit8 v8, v39, 0x2

    aget v26, v38, v8

    add-int/lit8 v8, v39, 0x3

    aget v8, v38, v8

    const/16 v30, 0x0

    cmpl-float v8, v8, v30

    if-eqz v8, :cond_22

    move/from16 v27, v29

    goto :goto_1a

    :cond_22
    move/from16 v27, p2

    :goto_1a
    add-int/lit8 v8, v39, 0x4

    aget v8, v38, v8

    cmpl-float v8, v8, v30

    if-eqz v8, :cond_23

    move/from16 v28, v29

    :goto_1b
    move/from16 v20, v4

    move/from16 v21, v5

    goto :goto_1c

    :cond_23
    move/from16 v28, p2

    goto :goto_1b

    :goto_1c
    invoke-static/range {v19 .. v28}, Lus0;->a(Landroid/graphics/Path;FFFFFFFZZ)V

    move-object/from16 v5, v19

    .line 100
    aget v4, v38, v6

    .line 101
    aget v2, v38, v2

    move/from16 v23, v2

    move/from16 v27, v23

    move/from16 v22, v4

    move/from16 v26, v22

    :goto_1d
    add-int v6, v39, v34

    move v4, v10

    move-object/from16 v2, v38

    goto/16 :goto_5

    :cond_24
    move/from16 v20, v26

    move/from16 v21, v27

    .line 102
    aput v20, v13, p2

    .line 103
    aput v21, v13, v29

    .line 104
    aput v22, v13, v17

    .line 105
    aput v23, v13, v18

    .line 106
    aput v35, v13, p1

    .line 107
    aput v36, v13, v32

    .line 108
    iget-char v2, v7, Lus0;->a:C

    add-int/lit8 v15, v15, 0x1

    move/from16 v4, p4

    move/from16 v19, v2

    move-object/from16 v2, v31

    move-object/from16 v6, v33

    move/from16 v8, v37

    const/4 v7, 0x0

    goto/16 :goto_2

    :cond_25
    :goto_1e
    move-object/from16 v31, v2

    move-object/from16 v33, v6

    move/from16 v37, v8

    goto :goto_1f

    :cond_26
    move/from16 v29, v15

    goto :goto_1e

    .line 109
    :goto_1f
    iget-object v2, v1, Lvg1;->b:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 110
    instance-of v4, v0, Lqg1;

    if-eqz v4, :cond_28

    .line 111
    iget v0, v0, Lug1;->c:I

    if-nez v0, :cond_27

    sget-object v0, Landroid/graphics/Path$FillType;->WINDING:Landroid/graphics/Path$FillType;

    goto :goto_20

    :cond_27
    sget-object v0, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    :goto_20
    invoke-virtual {v2, v0}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 112
    invoke-virtual {v2, v5, v12}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    .line 113
    invoke-virtual {v3, v2}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    move/from16 v7, p2

    goto/16 :goto_29

    .line 114
    :cond_28
    check-cast v0, Lrg1;

    .line 115
    iget v4, v0, Lrg1;->i:F

    const/16 v30, 0x0

    cmpl-float v6, v4, v30

    const/high16 v7, 0x3f800000    # 1.0f

    if-nez v6, :cond_2a

    iget v6, v0, Lrg1;->j:F

    cmpl-float v6, v6, v7

    if-eqz v6, :cond_29

    goto :goto_21

    :cond_29
    move/from16 v7, p2

    goto :goto_23

    .line 116
    :cond_2a
    :goto_21
    iget v6, v0, Lrg1;->k:F

    add-float/2addr v4, v6

    rem-float/2addr v4, v7

    .line 117
    iget v8, v0, Lrg1;->j:F

    add-float/2addr v8, v6

    rem-float/2addr v8, v7

    .line 118
    iget-object v6, v1, Lvg1;->f:Landroid/graphics/PathMeasure;

    if-nez v6, :cond_2b

    .line 119
    new-instance v6, Landroid/graphics/PathMeasure;

    invoke-direct {v6}, Landroid/graphics/PathMeasure;-><init>()V

    iput-object v6, v1, Lvg1;->f:Landroid/graphics/PathMeasure;

    :cond_2b
    move/from16 v7, p2

    .line 120
    invoke-virtual {v6, v5, v7}, Landroid/graphics/PathMeasure;->setPath(Landroid/graphics/Path;Z)V

    .line 121
    iget-object v6, v1, Lvg1;->f:Landroid/graphics/PathMeasure;

    invoke-virtual {v6}, Landroid/graphics/PathMeasure;->getLength()F

    move-result v6

    mul-float/2addr v4, v6

    mul-float/2addr v8, v6

    .line 122
    invoke-virtual {v5}, Landroid/graphics/Path;->reset()V

    cmpl-float v9, v4, v8

    .line 123
    iget-object v10, v1, Lvg1;->f:Landroid/graphics/PathMeasure;

    if-lez v9, :cond_2c

    move/from16 v9, v29

    .line 124
    invoke-virtual {v10, v4, v6, v5, v9}, Landroid/graphics/PathMeasure;->getSegment(FFLandroid/graphics/Path;Z)Z

    .line 125
    iget-object v4, v1, Lvg1;->f:Landroid/graphics/PathMeasure;

    const/4 v6, 0x0

    invoke-virtual {v4, v6, v8, v5, v9}, Landroid/graphics/PathMeasure;->getSegment(FFLandroid/graphics/Path;Z)Z

    goto :goto_22

    :cond_2c
    move/from16 v9, v29

    const/4 v6, 0x0

    .line 126
    invoke-virtual {v10, v4, v8, v5, v9}, Landroid/graphics/PathMeasure;->getSegment(FFLandroid/graphics/Path;Z)Z

    .line 127
    :goto_22
    invoke-virtual {v5, v6, v6}, Landroid/graphics/Path;->rLineTo(FF)V

    .line 128
    :goto_23
    invoke-virtual {v2, v5, v12}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    .line 129
    iget-object v4, v0, Lrg1;->f:Lo7;

    .line 130
    iget-object v5, v4, Lo7;->c:Ljava/lang/Object;

    check-cast v5, Landroid/graphics/Shader;

    const v6, 0xffffff

    const/4 v8, 0x0

    const/16 v9, 0xff

    const/high16 v10, 0x437f0000    # 255.0f

    if-eqz v5, :cond_2d

    goto :goto_24

    .line 131
    :cond_2d
    iget v5, v4, Lo7;->b:I

    if-eqz v5, :cond_31

    .line 132
    :goto_24
    iget-object v5, v1, Lvg1;->e:Landroid/graphics/Paint;

    if-nez v5, :cond_2e

    .line 133
    new-instance v5, Landroid/graphics/Paint;

    const/4 v13, 0x1

    invoke-direct {v5, v13}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v5, v1, Lvg1;->e:Landroid/graphics/Paint;

    .line 134
    sget-object v13, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v13}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 135
    :cond_2e
    iget-object v5, v1, Lvg1;->e:Landroid/graphics/Paint;

    .line 136
    iget-object v13, v4, Lo7;->c:Ljava/lang/Object;

    check-cast v13, Landroid/graphics/Shader;

    if-eqz v13, :cond_2f

    .line 137
    invoke-virtual {v13, v12}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 138
    invoke-virtual {v5, v13}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 139
    iget v4, v0, Lrg1;->h:F

    mul-float/2addr v4, v10

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_25

    .line 140
    :cond_2f
    invoke-virtual {v5, v8}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 141
    invoke-virtual {v5, v9}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 142
    iget v4, v4, Lo7;->b:I

    .line 143
    iget v13, v0, Lrg1;->h:F

    sget-object v14, Lyg1;->s:Landroid/graphics/PorterDuff$Mode;

    .line 144
    invoke-static {v4}, Landroid/graphics/Color;->alpha(I)I

    move-result v14

    and-int/2addr v4, v6

    int-to-float v14, v14

    mul-float/2addr v14, v13

    float-to-int v13, v14

    shl-int/lit8 v13, v13, 0x18

    or-int/2addr v4, v13

    .line 145
    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 146
    :goto_25
    invoke-virtual {v5, v8}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 147
    iget v4, v0, Lug1;->c:I

    if-nez v4, :cond_30

    sget-object v4, Landroid/graphics/Path$FillType;->WINDING:Landroid/graphics/Path$FillType;

    goto :goto_26

    :cond_30
    sget-object v4, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    :goto_26
    invoke-virtual {v2, v4}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 148
    invoke-virtual {v3, v2, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 149
    :cond_31
    iget-object v4, v0, Lrg1;->d:Lo7;

    .line 150
    iget-object v5, v4, Lo7;->c:Ljava/lang/Object;

    check-cast v5, Landroid/graphics/Shader;

    if-eqz v5, :cond_32

    goto :goto_27

    .line 151
    :cond_32
    iget v5, v4, Lo7;->b:I

    if-eqz v5, :cond_37

    .line 152
    :goto_27
    iget-object v5, v1, Lvg1;->d:Landroid/graphics/Paint;

    if-nez v5, :cond_33

    .line 153
    new-instance v5, Landroid/graphics/Paint;

    const/4 v13, 0x1

    invoke-direct {v5, v13}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v5, v1, Lvg1;->d:Landroid/graphics/Paint;

    .line 154
    sget-object v13, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v13}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 155
    :cond_33
    iget-object v5, v1, Lvg1;->d:Landroid/graphics/Paint;

    .line 156
    iget-object v13, v0, Lrg1;->m:Landroid/graphics/Paint$Join;

    if-eqz v13, :cond_34

    .line 157
    invoke-virtual {v5, v13}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 158
    :cond_34
    iget-object v13, v0, Lrg1;->l:Landroid/graphics/Paint$Cap;

    if-eqz v13, :cond_35

    .line 159
    invoke-virtual {v5, v13}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 160
    :cond_35
    iget v13, v0, Lrg1;->n:F

    invoke-virtual {v5, v13}, Landroid/graphics/Paint;->setStrokeMiter(F)V

    .line 161
    iget-object v13, v4, Lo7;->c:Ljava/lang/Object;

    check-cast v13, Landroid/graphics/Shader;

    if-eqz v13, :cond_36

    .line 162
    invoke-virtual {v13, v12}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 163
    invoke-virtual {v5, v13}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 164
    iget v4, v0, Lrg1;->g:F

    mul-float/2addr v4, v10

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_28

    .line 165
    :cond_36
    invoke-virtual {v5, v8}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 166
    invoke-virtual {v5, v9}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 167
    iget v4, v4, Lo7;->b:I

    .line 168
    iget v9, v0, Lrg1;->g:F

    sget-object v10, Lyg1;->s:Landroid/graphics/PorterDuff$Mode;

    .line 169
    invoke-static {v4}, Landroid/graphics/Color;->alpha(I)I

    move-result v10

    and-int/2addr v4, v6

    int-to-float v6, v10

    mul-float/2addr v6, v9

    float-to-int v6, v6

    shl-int/lit8 v6, v6, 0x18

    or-int/2addr v4, v6

    .line 170
    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 171
    :goto_28
    invoke-virtual {v5, v8}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    mul-float v11, v11, v37

    .line 172
    iget v0, v0, Lrg1;->e:F

    mul-float/2addr v0, v11

    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 173
    invoke-virtual {v3, v2, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_37
    :goto_29
    add-int/lit8 v8, v16, 0x1

    move-object/from16 v2, v31

    move-object/from16 v6, v33

    goto/16 :goto_0

    :cond_38
    move-object/from16 v3, p3

    .line 174
    invoke-virtual {v3}, Landroid/graphics/Canvas;->restore()V

    return-void

    :sswitch_data_0
    .sparse-switch
        0x41 -> :sswitch_4
        0x43 -> :sswitch_3
        0x48 -> :sswitch_2
        0x51 -> :sswitch_1
        0x53 -> :sswitch_1
        0x56 -> :sswitch_2
        0x5a -> :sswitch_0
        0x61 -> :sswitch_4
        0x63 -> :sswitch_3
        0x68 -> :sswitch_2
        0x71 -> :sswitch_1
        0x73 -> :sswitch_1
        0x76 -> :sswitch_2
        0x7a -> :sswitch_0
    .end sparse-switch

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public getAlpha()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lvg1;->getRootAlpha()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    const/high16 v0, 0x437f0000    # 255.0f

    .line 7
    .line 8
    div-float/2addr p0, v0

    .line 9
    return p0
.end method

.method public getRootAlpha()I
    .locals 0

    .line 1
    iget p0, p0, Lvg1;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public setAlpha(F)V
    .locals 1

    .line 1
    const/high16 v0, 0x437f0000    # 255.0f

    .line 2
    .line 3
    mul-float/2addr p1, v0

    .line 4
    float-to-int p1, p1

    .line 5
    invoke-virtual {p0, p1}, Lvg1;->setRootAlpha(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setRootAlpha(I)V
    .locals 0

    .line 1
    iput p1, p0, Lvg1;->l:I

    .line 2
    .line 3
    return-void
.end method
