.class public final Landroidx/lifecycle/SavedStateHandleAttacher;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lzh0;


# instance fields
.field public final j:Lu21;


# direct methods
.method public constructor <init>(Lu21;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/lifecycle/SavedStateHandleAttacher;->j:Lu21;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final c(Lci0;Lvh0;)V
    .locals 1

    .line 1
    sget-object v0, Lvh0;->ON_CREATE:Lvh0;

    .line 2
    .line 3
    if-ne p2, v0, :cond_3

    .line 4
    .line 5
    invoke-interface {p1}, Lci0;->e()Landroidx/lifecycle/a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1, p0}, Landroidx/lifecycle/a;->f(Lbi0;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Landroidx/lifecycle/SavedStateHandleAttacher;->j:Lu21;

    .line 13
    .line 14
    iget-boolean p1, p0, Lu21;->b:Z

    .line 15
    .line 16
    if-nez p1, :cond_2

    .line 17
    .line 18
    iget-object p1, p0, Lu21;->a:Lk6;

    .line 19
    .line 20
    const-string p2, "androidx.lifecycle.internal.SavedStateHandlesProvider"

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Lk6;->c(Ljava/lang/String;)Landroid/os/Bundle;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance p2, Landroid/os/Bundle;

    .line 27
    .line 28
    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lu21;->c:Landroid/os/Bundle;

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    if-eqz p1, :cond_1

    .line 39
    .line 40
    invoke-virtual {p2, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iput-object p2, p0, Lu21;->c:Landroid/os/Bundle;

    .line 44
    .line 45
    const/4 p1, 0x1

    .line 46
    iput-boolean p1, p0, Lu21;->b:Z

    .line 47
    .line 48
    iget-object p0, p0, Lu21;->d:Lgb1;

    .line 49
    .line 50
    invoke-virtual {p0}, Lgb1;->getValue()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Lv21;

    .line 55
    .line 56
    :cond_2
    return-void

    .line 57
    :cond_3
    const-string p0, "Next event must be ON_CREATE, it was "

    .line 58
    .line 59
    invoke-static {p2, p0}, Lo40;->w(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method
