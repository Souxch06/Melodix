.class final Lcom/melodix/music/PreviewLastTrackStore$Record;
.super Ljava/lang/Object;
.source "PreviewLastTrackStore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/melodix/music/PreviewLastTrackStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Record"
.end annotation


# instance fields
.field artist:Ljava/lang/String;

.field duration:J

.field image:[B

.field observed:J

.field position:J

.field state:Ljava/lang/String;

.field title:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
