.class public abstract Lcj1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# direct methods
.method public static a(Landroid/webkit/WebSettings;)Lmd1;
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    sget-object v1, Lkj1;->a:Lmd1;

    .line 3
    .line 4
    new-instance v2, Lmd1;

    .line 5
    .line 6
    const-class v3, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    .line 7
    .line 8
    iget-object v1, v1, Lmd1;->k:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v1, Lorg/chromium/support_lib_boundary/WebkitToCompatConverterBoundaryInterface;

    .line 11
    .line 12
    invoke-interface {v1, p0}, Lorg/chromium/support_lib_boundary/WebkitToCompatConverterBoundaryInterface;->convertSettings(Landroid/webkit/WebSettings;)Ljava/lang/reflect/InvocationHandler;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v3, v1}, Lbh;->a(Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    .line 21
    .line 22
    invoke-direct {v2, v0, v1}, Lmd1;-><init>(ILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    return-object v2

    .line 26
    :catch_0
    move-exception v1

    .line 27
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 28
    .line 29
    const/16 v3, 0x1e

    .line 30
    .line 31
    if-ne v2, v3, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string v2, "android.webkit.WebSettingsWrapper"

    .line 42
    .line 43
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_0

    .line 48
    .line 49
    new-instance p0, Ldj1;

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-direct {p0, v0, v1}, Lmd1;-><init>(ILjava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_0
    throw v1
.end method
