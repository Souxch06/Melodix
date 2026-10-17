.class public final synthetic Lv51;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic j:Lhz0;

.field public final synthetic k:Landroid/content/Context;

.field public final synthetic l:Lcom/melodix/music/SettingsActivity$a;

.field public final synthetic m:Le2;

.field public final synthetic n:Landroidx/preference/Preference;


# direct methods
.method public synthetic constructor <init>(Lhz0;Landroid/content/Context;Lcom/melodix/music/SettingsActivity$a;Le2;Landroidx/preference/Preference;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv51;->j:Lhz0;

    .line 5
    .line 6
    iput-object p2, p0, Lv51;->k:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Lv51;->l:Lcom/melodix/music/SettingsActivity$a;

    .line 9
    .line 10
    iput-object p4, p0, Lv51;->m:Le2;

    .line 11
    .line 12
    iput-object p5, p0, Lv51;->n:Landroidx/preference/Preference;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 8

    .line 1
    iget-object p1, p0, Lv51;->j:Lhz0;

    .line 2
    .line 3
    iget-object p1, p1, Lhz0;->j:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Lg4;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lg4;->dismiss()V

    .line 10
    .line 11
    .line 12
    :cond_0
    sget p1, Lcom/melodix/music/AppSingleton;->j:I

    .line 13
    .line 14
    iget-object v2, p0, Lv51;->k:Landroid/content/Context;

    .line 15
    .line 16
    invoke-static {v2}, Lm9;->g(Landroid/content/Context;)Landroid/webkit/WebView;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-eqz p1, :cond_4

    .line 21
    .line 22
    iget-object v1, p0, Lv51;->l:Lcom/melodix/music/SettingsActivity$a;

    .line 23
    .line 24
    invoke-virtual {v1}, Lh70;->g()Le6;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_4

    .line 29
    .line 30
    invoke-virtual {v1}, Lh70;->G()Le6;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    iget-object v3, p0, Lv51;->m:Le2;

    .line 35
    .line 36
    iget-object v7, v3, Le2;->a:Ljava/lang/String;

    .line 37
    .line 38
    new-instance v0, Lwb0;

    .line 39
    .line 40
    const/4 v5, 0x1

    .line 41
    iget-object v4, p0, Lv51;->n:Landroidx/preference/Preference;

    .line 42
    .line 43
    invoke-direct/range {v0 .. v5}, Lwb0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 44
    .line 45
    .line 46
    invoke-static {v6}, Lbh;->s(Landroid/content/Context;)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_2

    .line 59
    .line 60
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    move-object v2, v1

    .line 65
    check-cast v2, Le2;

    .line 66
    .line 67
    iget-object v2, v2, Le2;->a:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v2, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-eqz v2, :cond_1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    const/4 v1, 0x0

    .line 77
    :goto_0
    check-cast v1, Le2;

    .line 78
    .line 79
    if-nez v1, :cond_3

    .line 80
    .line 81
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 82
    .line 83
    invoke-virtual {v0, p0}, Lwb0;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 88
    .line 89
    .line 90
    move-result-wide v2

    .line 91
    iput-wide v2, v1, Le2;->h:J

    .line 92
    .line 93
    invoke-static {v6, v1}, Lbh;->B(Landroid/content/Context;Le2;)V

    .line 94
    .line 95
    .line 96
    iget-object p0, v1, Le2;->a:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {v6, p0}, Lbh;->C(Landroid/content/Context;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    new-instance v2, Lz1;

    .line 106
    .line 107
    invoke-direct {v2, v1, p0, p1, v0}, Lz1;-><init>(Le2;Landroid/webkit/CookieManager;Landroid/webkit/WebView;Lwb0;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0, v2}, Landroid/webkit/CookieManager;->removeAllCookies(Landroid/webkit/ValueCallback;)V

    .line 111
    .line 112
    .line 113
    :cond_4
    return-void
.end method
