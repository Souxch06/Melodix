.class public final synthetic Lv42;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# instance fields
.field public final synthetic j:Lc52;


# direct methods
.method public synthetic constructor <init>(Lc52;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv42;->j:Lc52;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv42;->j:Lc52;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string p1, "IABTCF_TCString"

    .line 7
    .line 8
    invoke-static {p2, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    const-string p1, "IABTCF_gdprApplies"

    .line 15
    .line 16
    invoke-static {p2, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    const-string p1, "IABTCF_EnableAdvertiserConsentMode"

    .line 23
    .line 24
    invoke-static {p2, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void

    .line 32
    :cond_1
    :goto_0
    iget-object p1, p0, Let;->j:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast p1, Ly02;

    .line 35
    .line 36
    iget-object p1, p1, Ly02;->o:Lzy1;

    .line 37
    .line 38
    invoke-static {p1}, Ly02;->l(Lm22;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p1, Lzy1;->w:Lso;

    .line 42
    .line 43
    const-string p2, "IABTCF_TCString change picked up in listener."

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Lso;->b(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lc52;->D:Lc32;

    .line 49
    .line 50
    invoke-static {p0}, Lbh;->h(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    const-wide/16 p1, 0x1f4

    .line 54
    .line 55
    invoke-virtual {p0, p1, p2}, Lfu1;->b(J)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
