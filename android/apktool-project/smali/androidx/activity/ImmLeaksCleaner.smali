.class final Landroidx/activity/ImmLeaksCleaner;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lzh0;


# static fields
.field public static j:I


# virtual methods
.method public final c(Lci0;Lvh0;)V
    .locals 0

    .line 1
    sget-object p0, Lvh0;->ON_DESTROY:Lvh0;

    .line 2
    .line 3
    if-eq p2, p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget p0, Landroidx/activity/ImmLeaksCleaner;->j:I

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    const/4 p0, 0x2

    .line 12
    :try_start_0
    sput p0, Landroidx/activity/ImmLeaksCleaner;->j:I

    .line 13
    .line 14
    const-class p0, Landroid/view/inputmethod/InputMethodManager;

    .line 15
    .line 16
    const-string p2, "mServedView"

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p2, p1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 23
    .line 24
    .line 25
    const-string p2, "mNextServedView"

    .line 26
    .line 27
    invoke-virtual {p0, p2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p2, p1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 32
    .line 33
    .line 34
    const-string p2, "mH"

    .line 35
    .line 36
    invoke-virtual {p0, p2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0, p1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 41
    .line 42
    .line 43
    sput p1, Landroidx/activity/ImmLeaksCleaner;->j:I
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    :catch_0
    :cond_1
    sget p0, Landroidx/activity/ImmLeaksCleaner;->j:I

    .line 46
    .line 47
    if-eq p0, p1, :cond_2

    .line 48
    .line 49
    :goto_0
    return-void

    .line 50
    :cond_2
    const/4 p0, 0x0

    .line 51
    throw p0
.end method
