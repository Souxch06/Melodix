.class public final Lgp0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:Landroid/view/ViewParent;

.field public b:Landroid/view/ViewParent;

.field public final c:Landroid/view/ViewGroup;

.field public d:Z

.field public e:[I


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lgp0;->c:Landroid/view/ViewGroup;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(FF)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lgp0;->d:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, v1}, Lgp0;->d(I)Landroid/view/ViewParent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lgp0;->c:Landroid/view/ViewGroup;

    .line 13
    .line 14
    :try_start_0
    invoke-static {v0, p0, p1, p2}, Lki1;->b(Landroid/view/ViewParent;Landroid/view/View;FF)Z

    .line 15
    .line 16
    .line 17
    move-result p0
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    return p0

    .line 19
    :catch_0
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    :cond_0
    return v1
.end method

.method public final b(II[I[II)Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Lgp0;->d:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_9

    .line 5
    .line 6
    invoke-virtual {p0, p5}, Lgp0;->d(I)Landroid/view/ViewParent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_3

    .line 13
    :cond_0
    const/4 v2, 0x1

    .line 14
    if-nez p1, :cond_2

    .line 15
    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    if-eqz p4, :cond_9

    .line 20
    .line 21
    aput v1, p4, v1

    .line 22
    .line 23
    aput v1, p4, v2

    .line 24
    .line 25
    return v1

    .line 26
    :cond_2
    :goto_0
    iget-object v3, p0, Lgp0;->c:Landroid/view/ViewGroup;

    .line 27
    .line 28
    if-eqz p4, :cond_3

    .line 29
    .line 30
    invoke-virtual {v3, p4}, Landroid/view/View;->getLocationInWindow([I)V

    .line 31
    .line 32
    .line 33
    aget v4, p4, v1

    .line 34
    .line 35
    aget v5, p4, v2

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_3
    move v4, v1

    .line 39
    move v5, v4

    .line 40
    :goto_1
    if-nez p3, :cond_4

    .line 41
    .line 42
    iget-object p3, p0, Lgp0;->e:[I

    .line 43
    .line 44
    if-nez p3, :cond_4

    .line 45
    .line 46
    const/4 p3, 0x2

    .line 47
    new-array p3, p3, [I

    .line 48
    .line 49
    iput-object p3, p0, Lgp0;->e:[I

    .line 50
    .line 51
    :cond_4
    aput v1, p3, v1

    .line 52
    .line 53
    aput v1, p3, v2

    .line 54
    .line 55
    instance-of p0, v0, Lhp0;

    .line 56
    .line 57
    if-eqz p0, :cond_5

    .line 58
    .line 59
    check-cast v0, Lhp0;

    .line 60
    .line 61
    invoke-interface {v0, p1, p2, p3, p5}, Lhp0;->d(II[II)V

    .line 62
    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_5
    if-nez p5, :cond_6

    .line 66
    .line 67
    :try_start_0
    invoke-static {v0, v3, p1, p2, p3}, Lki1;->c(Landroid/view/ViewParent;Landroid/view/View;II[I)V
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .line 69
    .line 70
    goto :goto_2

    .line 71
    :catch_0
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    :cond_6
    :goto_2
    if-eqz p4, :cond_7

    .line 75
    .line 76
    invoke-virtual {v3, p4}, Landroid/view/View;->getLocationInWindow([I)V

    .line 77
    .line 78
    .line 79
    aget p0, p4, v1

    .line 80
    .line 81
    sub-int/2addr p0, v4

    .line 82
    aput p0, p4, v1

    .line 83
    .line 84
    aget p0, p4, v2

    .line 85
    .line 86
    sub-int/2addr p0, v5

    .line 87
    aput p0, p4, v2

    .line 88
    .line 89
    :cond_7
    aget p0, p3, v1

    .line 90
    .line 91
    if-nez p0, :cond_8

    .line 92
    .line 93
    aget p0, p3, v2

    .line 94
    .line 95
    if-eqz p0, :cond_9

    .line 96
    .line 97
    :cond_8
    move v1, v2

    .line 98
    :cond_9
    :goto_3
    return v1
.end method

.method public final c(IIII[II[I)Z
    .locals 13

    .line 1
    move-object/from16 v0, p5

    .line 2
    .line 3
    move/from16 v7, p6

    .line 4
    .line 5
    iget-boolean v1, p0, Lgp0;->d:Z

    .line 6
    .line 7
    const/4 v9, 0x0

    .line 8
    if-eqz v1, :cond_a

    .line 9
    .line 10
    invoke-virtual {p0, v7}, Lgp0;->d(I)Landroid/view/ViewParent;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    goto/16 :goto_5

    .line 17
    .line 18
    :cond_0
    const/4 v10, 0x1

    .line 19
    if-nez p1, :cond_2

    .line 20
    .line 21
    if-nez p2, :cond_2

    .line 22
    .line 23
    if-nez p3, :cond_2

    .line 24
    .line 25
    if-eqz p4, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    if-eqz v0, :cond_a

    .line 29
    .line 30
    aput v9, v0, v9

    .line 31
    .line 32
    aput v9, v0, v10

    .line 33
    .line 34
    return v9

    .line 35
    :cond_2
    :goto_0
    iget-object v3, p0, Lgp0;->c:Landroid/view/ViewGroup;

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    invoke-virtual {v3, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 40
    .line 41
    .line 42
    aget v1, v0, v9

    .line 43
    .line 44
    aget v4, v0, v10

    .line 45
    .line 46
    move v11, v1

    .line 47
    move v12, v4

    .line 48
    goto :goto_1

    .line 49
    :cond_3
    move v11, v9

    .line 50
    move v12, v11

    .line 51
    :goto_1
    if-nez p7, :cond_5

    .line 52
    .line 53
    iget-object v1, p0, Lgp0;->e:[I

    .line 54
    .line 55
    if-nez v1, :cond_4

    .line 56
    .line 57
    const/4 v1, 0x2

    .line 58
    new-array v1, v1, [I

    .line 59
    .line 60
    iput-object v1, p0, Lgp0;->e:[I

    .line 61
    .line 62
    :cond_4
    aput v9, v1, v9

    .line 63
    .line 64
    aput v9, v1, v10

    .line 65
    .line 66
    move-object v8, v1

    .line 67
    goto :goto_2

    .line 68
    :cond_5
    move-object/from16 v8, p7

    .line 69
    .line 70
    :goto_2
    instance-of p0, v2, Lip0;

    .line 71
    .line 72
    if-eqz p0, :cond_6

    .line 73
    .line 74
    move-object v1, v2

    .line 75
    check-cast v1, Lip0;

    .line 76
    .line 77
    move v4, p2

    .line 78
    move/from16 v5, p3

    .line 79
    .line 80
    move/from16 v6, p4

    .line 81
    .line 82
    move-object v2, v3

    .line 83
    move v3, p1

    .line 84
    invoke-interface/range {v1 .. v8}, Lip0;->e(Landroid/view/ViewGroup;IIIII[I)V

    .line 85
    .line 86
    .line 87
    :goto_3
    move-object v3, v2

    .line 88
    goto :goto_4

    .line 89
    :cond_6
    aget p0, v8, v9

    .line 90
    .line 91
    add-int p0, p0, p3

    .line 92
    .line 93
    aput p0, v8, v9

    .line 94
    .line 95
    aget p0, v8, v10

    .line 96
    .line 97
    add-int p0, p0, p4

    .line 98
    .line 99
    aput p0, v8, v10

    .line 100
    .line 101
    instance-of p0, v2, Lhp0;

    .line 102
    .line 103
    if-eqz p0, :cond_7

    .line 104
    .line 105
    move-object v1, v2

    .line 106
    check-cast v1, Lhp0;

    .line 107
    .line 108
    move v4, p2

    .line 109
    move/from16 v5, p3

    .line 110
    .line 111
    move/from16 v6, p4

    .line 112
    .line 113
    move/from16 v7, p6

    .line 114
    .line 115
    move-object v2, v3

    .line 116
    move v3, p1

    .line 117
    invoke-interface/range {v1 .. v7}, Lhp0;->b(Landroid/view/ViewGroup;IIIII)V

    .line 118
    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_7
    if-nez p6, :cond_8

    .line 122
    .line 123
    move v4, p1

    .line 124
    move v5, p2

    .line 125
    move/from16 v6, p3

    .line 126
    .line 127
    move/from16 v7, p4

    .line 128
    .line 129
    :try_start_0
    invoke-static/range {v2 .. v7}, Lki1;->d(Landroid/view/ViewParent;Landroid/view/View;IIII)V
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    .line 131
    .line 132
    goto :goto_4

    .line 133
    :catch_0
    invoke-static {v2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    :cond_8
    :goto_4
    if-eqz v0, :cond_9

    .line 137
    .line 138
    invoke-virtual {v3, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 139
    .line 140
    .line 141
    aget p0, v0, v9

    .line 142
    .line 143
    sub-int/2addr p0, v11

    .line 144
    aput p0, v0, v9

    .line 145
    .line 146
    aget p0, v0, v10

    .line 147
    .line 148
    sub-int/2addr p0, v12

    .line 149
    aput p0, v0, v10

    .line 150
    .line 151
    :cond_9
    return v10

    .line 152
    :cond_a
    :goto_5
    return v9
.end method

.method public final d(I)Landroid/view/ViewParent;
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lgp0;->b:Landroid/view/ViewParent;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_1
    iget-object p0, p0, Lgp0;->a:Landroid/view/ViewParent;

    .line 12
    .line 13
    return-object p0
.end method

.method public final e(I)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lgp0;->d(I)Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final f(II)Z
    .locals 7

    .line 1
    invoke-virtual {p0, p2}, Lgp0;->e(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    goto :goto_3

    .line 9
    :cond_0
    iget-boolean v0, p0, Lgp0;->d:Z

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v0, :cond_9

    .line 13
    .line 14
    iget-object v0, p0, Lgp0;->c:Landroid/view/ViewGroup;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    move-object v4, v0

    .line 21
    :goto_0
    if-eqz v3, :cond_9

    .line 22
    .line 23
    instance-of v5, v3, Lhp0;

    .line 24
    .line 25
    if-eqz v5, :cond_1

    .line 26
    .line 27
    move-object v6, v3

    .line 28
    check-cast v6, Lhp0;

    .line 29
    .line 30
    invoke-interface {v6, v4, v0, p1, p2}, Lhp0;->f(Landroid/view/View;Landroid/view/View;II)Z

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    if-nez p2, :cond_2

    .line 36
    .line 37
    :try_start_0
    invoke-static {v3, v4, v0, p1}, Lki1;->f(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;I)Z

    .line 38
    .line 39
    .line 40
    move-result v6
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    goto :goto_1

    .line 42
    :catch_0
    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    :cond_2
    move v6, v2

    .line 46
    :goto_1
    if-eqz v6, :cond_7

    .line 47
    .line 48
    if-eqz p2, :cond_4

    .line 49
    .line 50
    if-eq p2, v1, :cond_3

    .line 51
    .line 52
    goto :goto_2

    .line 53
    :cond_3
    iput-object v3, p0, Lgp0;->b:Landroid/view/ViewParent;

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_4
    iput-object v3, p0, Lgp0;->a:Landroid/view/ViewParent;

    .line 57
    .line 58
    :goto_2
    if-eqz v5, :cond_5

    .line 59
    .line 60
    check-cast v3, Lhp0;

    .line 61
    .line 62
    invoke-interface {v3, v4, v0, p1, p2}, Lhp0;->a(Landroid/view/View;Landroid/view/View;II)V

    .line 63
    .line 64
    .line 65
    goto :goto_3

    .line 66
    :cond_5
    if-nez p2, :cond_6

    .line 67
    .line 68
    :try_start_1
    invoke-static {v3, v4, v0, p1}, Lki1;->e(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;I)V
    :try_end_1
    .catch Ljava/lang/AbstractMethodError; {:try_start_1 .. :try_end_1} :catch_1

    .line 69
    .line 70
    .line 71
    goto :goto_3

    .line 72
    :catch_1
    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    :cond_6
    :goto_3
    return v1

    .line 76
    :cond_7
    instance-of v5, v3, Landroid/view/View;

    .line 77
    .line 78
    if-eqz v5, :cond_8

    .line 79
    .line 80
    move-object v4, v3

    .line 81
    check-cast v4, Landroid/view/View;

    .line 82
    .line 83
    :cond_8
    invoke-interface {v3}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    goto :goto_0

    .line 88
    :cond_9
    return v2
.end method

.method public final g(I)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lgp0;->d(I)Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    instance-of v1, v0, Lhp0;

    .line 8
    .line 9
    iget-object v2, p0, Lgp0;->c:Landroid/view/ViewGroup;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    check-cast v0, Lhp0;

    .line 14
    .line 15
    invoke-interface {v0, v2, p1}, Lhp0;->c(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    if-nez p1, :cond_1

    .line 20
    .line 21
    :try_start_0
    invoke-static {v0, v2}, Lki1;->g(Landroid/view/ViewParent;Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/AbstractMethodError; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catch_0
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 29
    if-eqz p1, :cond_3

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    if-eq p1, v1, :cond_2

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_2
    iput-object v0, p0, Lgp0;->b:Landroid/view/ViewParent;

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_3
    iput-object v0, p0, Lgp0;->a:Landroid/view/ViewParent;

    .line 39
    .line 40
    :cond_4
    :goto_1
    return-void
.end method
