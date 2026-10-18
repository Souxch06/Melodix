.class public Lcom/google/android/material/sidesheet/SideSheetBehavior;
.super Las;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Las;"
    }
.end annotation


# instance fields
.field public final j:Lfm0;

.field public final k:Landroid/content/res/ColorStateList;

.field public final l:Lr61;

.field public m:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x6

    .line 157
    invoke-direct {p0, v0}, Las;-><init>(I)V

    .line 158
    new-instance v0, Lpa0;

    invoke-direct {v0, p0}, Lpa0;-><init>(Lcom/google/android/material/sidesheet/SideSheetBehavior;)V

    const/4 v0, 0x5

    .line 159
    iput v0, p0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->m:I

    .line 160
    new-instance p0, Ljava/util/LinkedHashSet;

    invoke-direct {p0}, Ljava/util/LinkedHashSet;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5

    .line 1
    const/4 v0, 0x6

    .line 2
    invoke-direct {p0, v0}, Las;-><init>(I)V

    .line 3
    .line 4
    .line 5
    new-instance v1, Lpa0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lpa0;-><init>(Lcom/google/android/material/sidesheet/SideSheetBehavior;)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x5

    .line 11
    iput v1, p0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->m:I

    .line 12
    .line 13
    new-instance v2, Ljava/util/LinkedHashSet;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    .line 16
    .line 17
    .line 18
    sget-object v2, Lfx0;->m:[I

    .line 19
    .line 20
    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const/4 v3, 0x3

    .line 25
    invoke-virtual {v2, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-eqz v4, :cond_0

    .line 30
    .line 31
    invoke-static {p1, v2, v3}, Lbv;->i(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    iput-object v3, p0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->k:Landroid/content/res/ColorStateList;

    .line 36
    .line 37
    :cond_0
    invoke-virtual {v2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    const v3, 0x7f1203e9

    .line 45
    .line 46
    .line 47
    invoke-static {p1, p2, v0, v3}, Lr61;->a(Landroid/content/Context;Landroid/util/AttributeSet;II)Lq61;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-virtual {p2}, Lq61;->a()Lr61;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    iput-object p2, p0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->l:Lr61;

    .line 56
    .line 57
    :cond_1
    invoke-virtual {v2, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    if-eqz p2, :cond_2

    .line 62
    .line 63
    const/4 p2, -0x1

    .line 64
    invoke-virtual {v2, v1, p2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 65
    .line 66
    .line 67
    :cond_2
    iget-object p2, p0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->l:Lr61;

    .line 68
    .line 69
    const/4 v0, 0x1

    .line 70
    if-nez p2, :cond_3

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    new-instance v1, Lfm0;

    .line 74
    .line 75
    invoke-direct {v1, p2}, Lfm0;-><init>(Lr61;)V

    .line 76
    .line 77
    .line 78
    iput-object v1, p0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->j:Lfm0;

    .line 79
    .line 80
    iget-object p2, v1, Lfm0;->j:Lem0;

    .line 81
    .line 82
    new-instance v3, Ltz;

    .line 83
    .line 84
    invoke-direct {v3, p1}, Ltz;-><init>(Landroid/content/Context;)V

    .line 85
    .line 86
    .line 87
    iput-object v3, p2, Lem0;->b:Ltz;

    .line 88
    .line 89
    invoke-virtual {v1}, Lfm0;->h()V

    .line 90
    .line 91
    .line 92
    iget-object p2, p0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->k:Landroid/content/res/ColorStateList;

    .line 93
    .line 94
    if-eqz p2, :cond_4

    .line 95
    .line 96
    iget-object p0, p0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->j:Lfm0;

    .line 97
    .line 98
    iget-object v1, p0, Lfm0;->j:Lem0;

    .line 99
    .line 100
    iget-object v3, v1, Lem0;->c:Landroid/content/res/ColorStateList;

    .line 101
    .line 102
    if-eq v3, p2, :cond_5

    .line 103
    .line 104
    iput-object p2, v1, Lem0;->c:Landroid/content/res/ColorStateList;

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    invoke-virtual {p0, p2}, Lfm0;->onStateChange([I)Z

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_4
    new-instance p2, Landroid/util/TypedValue;

    .line 115
    .line 116
    invoke-direct {p2}, Landroid/util/TypedValue;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    const v3, 0x1010031

    .line 124
    .line 125
    .line 126
    invoke-virtual {v1, v3, p2, v0}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Lcom/google/android/material/sidesheet/SideSheetBehavior;->j:Lfm0;

    .line 130
    .line 131
    iget p2, p2, Landroid/util/TypedValue;->data:I

    .line 132
    .line 133
    invoke-virtual {p0, p2}, Lfm0;->setTint(I)V

    .line 134
    .line 135
    .line 136
    :cond_5
    :goto_0
    const/4 p0, 0x2

    .line 137
    const/high16 p2, -0x40800000    # -1.0f

    .line 138
    .line 139
    invoke-virtual {v2, p0, p2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 140
    .line 141
    .line 142
    const/4 p0, 0x4

    .line 143
    invoke-virtual {v2, p0, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 144
    .line 145
    .line 146
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 147
    .line 148
    .line 149
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 154
    .line 155
    .line 156
    return-void
.end method
