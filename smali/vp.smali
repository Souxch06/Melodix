.class public abstract synthetic Lvp;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# direct methods
.method public static bridge synthetic a(Landroid/view/ContentInfo;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ContentInfo;->getFlags()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static bridge synthetic b(Landroid/view/ContentInfo;)Landroid/content/ClipData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ContentInfo;->getClip()Landroid/content/ClipData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static bridge synthetic c(Landroid/os/StrictMode$VmPolicy$Builder;)Landroid/os/StrictMode$VmPolicy$Builder;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/os/StrictMode$VmPolicy$Builder;->permitUnsafeIntentLaunch()Landroid/os/StrictMode$VmPolicy$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Landroid/content/ClipData;I)Landroid/view/ContentInfo$Builder;
    .locals 1

    .line 1
    new-instance v0, Landroid/view/ContentInfo$Builder;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Landroid/view/ContentInfo$Builder;-><init>(Landroid/content/ClipData;I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static bridge synthetic e(Landroid/view/ContentInfo$Builder;)Landroid/view/ContentInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ContentInfo$Builder;->build()Landroid/view/ContentInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static bridge synthetic f(Ljava/lang/Object;)Landroid/view/ContentInfo;
    .locals 0

    .line 1
    check-cast p0, Landroid/view/ContentInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic g(Landroid/app/Notification$CallStyle;Landroid/app/Notification$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/app/Notification$CallStyle;->setBuilder(Landroid/app/Notification$Builder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic h(Landroid/view/ContentInfo$Builder;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/ContentInfo$Builder;->setFlags(I)Landroid/view/ContentInfo$Builder;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic i(Landroid/view/ContentInfo$Builder;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/ContentInfo$Builder;->setLinkUri(Landroid/net/Uri;)Landroid/view/ContentInfo$Builder;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic j(Landroid/view/ContentInfo$Builder;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/ContentInfo$Builder;->setExtras(Landroid/os/Bundle;)Landroid/view/ContentInfo$Builder;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic k(Landroid/view/ContentInfo;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ContentInfo;->getSource()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
