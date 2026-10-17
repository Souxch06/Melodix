.class public final Ltz;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final f:I


# instance fields
.field public final a:Z

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide v0, 0x4014666666666667L    # 5.1000000000000005

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    long-to-int v0, v0

    .line 11
    sput v0, Ltz;->f:I

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 5

    .line 1
    const v0, 0x7f04019a

    .line 2
    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-static {p1, v0, v1}, Las;->t(Landroid/content/Context;IZ)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const v2, 0x7f040199

    .line 10
    .line 11
    .line 12
    invoke-static {p1, v2}, Las;->s(Landroid/content/Context;I)Landroid/util/TypedValue;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    iget v3, v2, Landroid/util/TypedValue;->resourceId:I

    .line 19
    .line 20
    if-eqz v3, :cond_0

    .line 21
    .line 22
    invoke-static {p1, v3}, Lbq;->a(Landroid/content/Context;I)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget v2, v2, Landroid/util/TypedValue;->data:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    move v2, v1

    .line 31
    :goto_0
    const v3, 0x7f040198

    .line 32
    .line 33
    .line 34
    invoke-static {p1, v3}, Las;->s(Landroid/content/Context;I)Landroid/util/TypedValue;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    if-eqz v3, :cond_3

    .line 39
    .line 40
    iget v4, v3, Landroid/util/TypedValue;->resourceId:I

    .line 41
    .line 42
    if-eqz v4, :cond_2

    .line 43
    .line 44
    invoke-static {p1, v4}, Lbq;->a(Landroid/content/Context;I)I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    goto :goto_1

    .line 49
    :cond_2
    iget v3, v3, Landroid/util/TypedValue;->data:I

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_3
    move v3, v1

    .line 53
    :goto_1
    const v4, 0x7f040114

    .line 54
    .line 55
    .line 56
    invoke-static {p1, v4}, Las;->s(Landroid/content/Context;I)Landroid/util/TypedValue;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    if-eqz v4, :cond_5

    .line 61
    .line 62
    iget v1, v4, Landroid/util/TypedValue;->resourceId:I

    .line 63
    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    invoke-static {p1, v1}, Lbq;->a(Landroid/content/Context;I)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    goto :goto_2

    .line 71
    :cond_4
    iget v1, v4, Landroid/util/TypedValue;->data:I

    .line 72
    .line 73
    :cond_5
    :goto_2
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    .line 82
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    .line 85
    .line 86
    iput-boolean v0, p0, Ltz;->a:Z

    .line 87
    .line 88
    iput v2, p0, Ltz;->b:I

    .line 89
    .line 90
    iput v3, p0, Ltz;->c:I

    .line 91
    .line 92
    iput v1, p0, Ltz;->d:I

    .line 93
    .line 94
    iput p1, p0, Ltz;->e:F

    .line 95
    .line 96
    return-void
.end method
