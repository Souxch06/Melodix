.class public final Lj3;
.super Lst;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic g:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lj3;->g:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final j(ILandroid/content/Intent;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget p0, p0, Lj3;->g:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    new-instance p0, Lh3;

    .line 7
    .line 8
    invoke-direct {p0, p1, p2}, Lh3;-><init>(ILandroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-object p0

    .line 12
    :pswitch_0
    new-instance p0, Lh3;

    .line 13
    .line 14
    invoke-direct {p0, p1, p2}, Lh3;-><init>(ILandroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_1
    const/4 p0, -0x1

    .line 19
    if-eq p1, p0, :cond_0

    .line 20
    .line 21
    goto/16 :goto_3

    .line 22
    .line 23
    :cond_0
    if-nez p2, :cond_1

    .line 24
    .line 25
    goto/16 :goto_3

    .line 26
    .line 27
    :cond_1
    const-string p0, "androidx.activity.result.contract.extra.PERMISSIONS"

    .line 28
    .line 29
    invoke-virtual {p2, p0}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "androidx.activity.result.contract.extra.PERMISSION_GRANT_RESULTS"

    .line 34
    .line 35
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getIntArrayExtra(Ljava/lang/String;)[I

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    if-eqz p1, :cond_6

    .line 40
    .line 41
    if-nez p0, :cond_2

    .line 42
    .line 43
    goto :goto_3

    .line 44
    :cond_2
    new-instance p2, Ljava/util/ArrayList;

    .line 45
    .line 46
    array-length v0, p1

    .line 47
    invoke-direct {p2, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 48
    .line 49
    .line 50
    array-length v0, p1

    .line 51
    const/4 v1, 0x0

    .line 52
    move v2, v1

    .line 53
    :goto_0
    if-ge v2, v0, :cond_4

    .line 54
    .line 55
    aget v3, p1, v2

    .line 56
    .line 57
    if-nez v3, :cond_3

    .line 58
    .line 59
    const/4 v3, 0x1

    .line 60
    goto :goto_1

    .line 61
    :cond_3
    move v3, v1

    .line 62
    :goto_1
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    add-int/lit8 v2, v2, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_4
    invoke-static {p0}, Lia;->P([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Ljava/util/ArrayList;

    .line 85
    .line 86
    const/16 v2, 0xa

    .line 87
    .line 88
    invoke-static {p0, v2}, Ldl;->w(Ljava/lang/Iterable;I)I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    invoke-static {p2, v2}, Ldl;->w(Ljava/lang/Iterable;I)I

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    invoke-static {p0, p2}, Ljava/lang/Math;->min(II)I

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(I)V

    .line 101
    .line 102
    .line 103
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-eqz p0, :cond_5

    .line 108
    .line 109
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_5

    .line 114
    .line 115
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    new-instance v2, Lps0;

    .line 124
    .line 125
    invoke-direct {v2, p0, p2}, Lps0;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_5
    invoke-static {v1}, Lsl0;->J(Ljava/util/ArrayList;)Ljava/util/Map;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    goto :goto_4

    .line 137
    :cond_6
    :goto_3
    sget-object p0, Lv00;->j:Lv00;

    .line 138
    .line 139
    :goto_4
    return-object p0

    .line 140
    nop

    .line 141
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
