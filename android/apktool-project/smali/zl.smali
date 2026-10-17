.class public final synthetic Lzl;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lxr0;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Le6;


# direct methods
.method public synthetic constructor <init>(Le6;I)V
    .locals 0

    .line 1
    iput p2, p0, Lzl;->a:I

    .line 2
    .line 3
    iput-object p1, p0, Lzl;->b:Le6;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 9

    .line 1
    iget v0, p0, Lzl;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Lzl;->b:Le6;

    .line 4
    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Le6;->A:Lbv1;

    .line 9
    .line 10
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p0, Lj70;

    .line 13
    .line 14
    iget-object v0, p0, Lj70;->A:Lz70;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, p0, p0, v1}, Lz70;->b(Lj70;Lju1;Lh70;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :pswitch_0
    iget-object v0, p0, Landroidx/activity/a;->n:Lo80;

    .line 22
    .line 23
    iget-object v0, v0, Lo80;->c:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v0, Lk6;

    .line 26
    .line 27
    const-string v1, "android:support:activity-result"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lk6;->c(Ljava/lang/String;)Landroid/os/Bundle;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    iget-object p0, p0, Landroidx/activity/a;->s:Lam;

    .line 36
    .line 37
    iget-object v1, p0, Lam;->b:Ljava/util/HashMap;

    .line 38
    .line 39
    iget-object v2, p0, Lam;->a:Ljava/util/HashMap;

    .line 40
    .line 41
    iget-object v3, p0, Lam;->g:Landroid/os/Bundle;

    .line 42
    .line 43
    const-string v4, "KEY_COMPONENT_ACTIVITY_REGISTERED_RCS"

    .line 44
    .line 45
    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    const-string v5, "KEY_COMPONENT_ACTIVITY_REGISTERED_KEYS"

    .line 50
    .line 51
    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    if-eqz v5, :cond_2

    .line 56
    .line 57
    if-nez v4, :cond_0

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_0
    const-string v6, "KEY_COMPONENT_ACTIVITY_LAUNCHED_KEYS"

    .line 61
    .line 62
    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    iput-object v6, p0, Lam;->d:Ljava/util/ArrayList;

    .line 67
    .line 68
    const-string v6, "KEY_COMPONENT_ACTIVITY_PENDING_RESULT"

    .line 69
    .line 70
    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v3, v0}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 75
    .line 76
    .line 77
    const/4 v0, 0x0

    .line 78
    :goto_0
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    if-ge v0, v6, :cond_2

    .line 83
    .line 84
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    check-cast v6, Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v1, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v7

    .line 94
    if-eqz v7, :cond_1

    .line 95
    .line 96
    invoke-virtual {v1, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v7

    .line 100
    check-cast v7, Ljava/lang/Integer;

    .line 101
    .line 102
    invoke-virtual {v3, v6}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 103
    .line 104
    .line 105
    move-result v6

    .line 106
    if-nez v6, :cond_1

    .line 107
    .line 108
    invoke-virtual {v2, v7}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    :cond_1
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v6

    .line 115
    check-cast v6, Ljava/lang/Integer;

    .line 116
    .line 117
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 118
    .line 119
    .line 120
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v7

    .line 124
    check-cast v7, Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v2, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    iget-object v8, p0, Lam;->b:Ljava/util/HashMap;

    .line 130
    .line 131
    invoke-virtual {v8, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    add-int/lit8 v0, v0, 0x1

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_2
    :goto_1
    return-void

    .line 138
    nop

    .line 139
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
